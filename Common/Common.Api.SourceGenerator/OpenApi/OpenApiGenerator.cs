using System.Collections.Immutable;
using System.Text;
using System.Text.RegularExpressions;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.CodeAnalysis.Text;

namespace Zeta.Common.Api.SourceGenerator.OpenApi;

[Generator]
public class OpenApiGenerator : IIncrementalGenerator
{
    private const string SuccessAttributePath =
        "Zoo.Common.Api.SourceGenerator.Attributes.OpenApi.SuccessResponseAttribute";

    private static Regex HttpVerbAttributeRegex =
        new(@"Microsoft.AspNetCore.Mvc.Http(.*)Attribute", RegexOptions.Compiled);

    public void Initialize(IncrementalGeneratorInitializationContext context)
    {
        // Find all controllers with relevant attributes
        var controllerDeclarations = context.SyntaxProvider
            .CreateSyntaxProvider(
                predicate: static (s, _) => IsSyntaxTargetForGeneration(s),
                transform: static (ctx, _) => GetSemanticTargetForGeneration(ctx)
            ).Where(static m => m is not null);

        // Combine the selected enums with the `Compilation`
        IncrementalValueProvider<(Compilation, ImmutableArray<ClassDeclarationSyntax>)> compilationAndControllers
            = context.CompilationProvider.Combine(controllerDeclarations.Collect())!;

        // Generate the source using the compilation and enums
        context.RegisterSourceOutput(compilationAndControllers,
            static (spc, source) => Execute(source.Item1, source.Item2, spc));
    }

    private static bool IsSyntaxTargetForGeneration(SyntaxNode node)
        => node is ClassDeclarationSyntax { AttributeLists.Count: > 0 };

    private static ClassDeclarationSyntax? GetSemanticTargetForGeneration(GeneratorSyntaxContext context)
    {
        var declarationSyntax = (ClassDeclarationSyntax)context.Node;
        var foundApiController = false;
        var foundDoNotGenerateResponses = false;

        foreach (var attributeListSyntax in declarationSyntax.AttributeLists)
        {
            foreach (var attributeSyntax in attributeListSyntax.Attributes)
            {
                // Couldn't find symbol, ignore
                if (context.SemanticModel.GetSymbolInfo(attributeSyntax).Symbol is not IMethodSymbol
                    attributeSymbol)
                    continue;

                var attributeContainingTypeSymbol = attributeSymbol.ContainingType;
                var fullName = attributeContainingTypeSymbol.ToDisplayString();
                // Is it the [ApiController] attribute?
                if (fullName is "Microsoft.AspNetCore.Mvc.ApiControllerAttribute")
                {
                    foundApiController = true;

                    continue;
                }
                // Is it the [DoNotGenerateResponses] attribute?
                if (fullName is "Zoo.Common.Api.SourceGenerator.Attributes.OpenApi.DoNotGenerateResponsesAttribute")
                {
                    foundDoNotGenerateResponses = true;
                }
            }
        }

        if (foundApiController && !foundDoNotGenerateResponses)
            return declarationSyntax;

        // Didn't have any attributes we were looking for
        return null;
    }

    public static string GetResponseData(INamedTypeSymbol symbol, SourceProductionContext context)
    {
        var name = symbol.ToString();
        if (name is "MediatR.Unit")
            return "204";

        var errorInterface = symbol.AllInterfaces.FirstOrDefault();
        if (errorInterface is null)
            return $"typeof({symbol}), 200";

        var errorLastPart = errorInterface.ToString().Split('.').Last();
        return errorLastPart switch
        {
            nameof(INotFoundError) => $"typeof({GetErrorFullName(symbol)}), 404",
            nameof(IValidationError) => $"typeof({GetErrorFullName(symbol)}), 400",
            nameof(IAlreadyExistsError) => $"typeof({GetErrorFullName(symbol)}), 409",
            nameof(IError) => ReportBaseErrorDiagnostic(),
            _ => $"typeof({symbol}), 200"
        };

        string ReportBaseErrorDiagnostic()
        {
            context.ReportDiagnostic(Diagnostic.Create(
                new(
                    "OA0001",
                    "Error is the base error",
                    "{0} is the base error type. The base error type cannot be directly returned",
                    "OpenApi.Generator",
                    DiagnosticSeverity.Error,
                    true
                ),
                symbol.Locations.FirstOrDefault(),
                errorInterface.ToString()
            ));

            return $"typeof({GetErrorFullName(symbol)}), 500";
        }
    }

    private static string GetErrorFullName(INamedTypeSymbol symbol) => symbol.ToString();

    private static void Execute(Compilation compilation, ImmutableArray<ClassDeclarationSyntax> classDeclarations,
        SourceProductionContext context)
    {
        //if (!Debugger.IsAttached)Debugger.Launch();
        if (classDeclarations.IsDefaultOrEmpty)
            return;

        var distinctClassDeclarations = classDeclarations.Distinct();
        var classesToGenerate =
            GetClassesToGenerate(compilation, distinctClassDeclarations, context);

        foreach (var classToGenerate in classesToGenerate)
        {
            var methods = new List<string>(classToGenerate.Methods.Count);

            foreach (var method in classToGenerate.Methods)
            {
                const string indentation = "        ";
                const string producesResponseType =
                    "Microsoft.AspNetCore.Mvc.ProducesResponseType";

                var builder = new StringBuilder();
                var startIndex = method.ActionInfo.SuccessAttributeData is null ? 0 : 1;

                // Concrete types
                if (method.ActionInfo.SuccessAttributeData is not null)
                {
                    var attributeData = method.ActionInfo.SuccessAttributeData;
                    var arguments = attributeData.ConstructorArguments.Select(x => x.Value?.ToString()).ToList();
                    var argumentsJoined = arguments.Count is 2
                        ? $"typeof({arguments[0]}), {arguments[1]}"
                        : arguments[0];

                    builder.AppendLine($"{indentation}[{producesResponseType}({argumentsJoined})]");
                }
                for (var i = startIndex; i < method.ActionInfo.NamedSymbols.Count; i++)
                {
                    var namedSymbol = method.ActionInfo.NamedSymbols[i];
                    var responseData = GetResponseData(namedSymbol, context);

                    builder.AppendLine($"{indentation}[{producesResponseType}({responseData})]");
                }
                builder.AppendLine(
                    $"{indentation}[{producesResponseType}(typeof(System.Collections.Generic.List<Zoo.Common.PropertyError>), 422)]");

                var parameters = string.Join(", ", method.Parameters);
                builder.AppendLine(
                    $"{indentation}public partial {method.ReturnType} {method.Name}({parameters});");

                methods.Add(builder.ToString());
            }

            var result =
                @$"namespace {classToGenerate.NamespaceName}
{{
    public partial class {classToGenerate.ClassName} 
    {{
{string.Join("\n", methods)}
    }}
}}
";

            context.AddSource($"{classToGenerate.ClassName}OpenApi.g.cs", SourceText.From(result, Encoding.UTF8));
        }
    }

    private static IEnumerable<ClassesToGenerate> GetClassesToGenerate(Compilation compilation,
        IEnumerable<ClassDeclarationSyntax> classDeclarations, SourceProductionContext context)
    {
        foreach (var classDeclaration in classDeclarations)
        {
            context.CancellationToken.ThrowIfCancellationRequested();

            var semanticModel = compilation.GetSemanticModel(classDeclaration.SyntaxTree);
            if (semanticModel.GetDeclaredSymbol(classDeclaration) is not INamedTypeSymbol classSymbol)
                continue;

            var namespaceName = GetNamespace(classDeclaration);
            var className = classSymbol.ToString().Split('.').Last();
            var classMembers = classSymbol.GetMembers();
            var members = new List<MethodInfo>(classMembers.Length);

            for (var i = 0; i < classMembers.Length; i++)
            {
                var member = classMembers[i];
                if (member is not IMethodSymbol method) continue;
                if (classSymbol.Constructors.Any(x => SymbolEqualityComparer.Default.Equals(x, method))) continue;

                var attributes = member.GetAttributes();
                var hasHttpVerbAttribute =
                    attributes.Any(x => HttpVerbAttributeRegex.Match(x.AttributeClass!.ToString()).Success);
                if (!hasHttpVerbAttribute) continue;
                var successAttribute =
                    attributes.FirstOrDefault(x => x.AttributeClass!.ToString() == SuccessAttributePath);

                var declarationMember = (MethodDeclarationSyntax)classDeclaration.Members[i];
                var body = declarationMember.Body;
                var localDeclarationStatements =
                    body!.Statements.Where(static x => x is LocalDeclarationStatementSyntax);

                ActionInfo? actionInfo = null;
                foreach (var localDeclaration in localDeclarationStatements)
                {
                    if (localDeclaration is not LocalDeclarationStatementSyntax localDeclarationStatementSyntax)
                        continue;
                    var initializer = localDeclarationStatementSyntax.Declaration.Variables.First().Initializer;
                    if (initializer?.Value is not ObjectCreationExpressionSyntax objectType) continue;
                    var requestType = objectType.Type;
                    if (semanticModel.GetSymbolInfo(requestType).Symbol is not ITypeSymbol requestSymbol) continue;
                    // Should be IRequest<T>
                    var requestReturn = requestSymbol.AllInterfaces.FirstOrDefault();
                    if (requestReturn?.TypeArguments[0] is not INamedTypeSymbol typeArgument) continue;
                    if (typeArgument.Name == "OneOf")
                    {
                        actionInfo = new(typeArgument.TypeArguments.Cast<INamedTypeSymbol>().ToList(),
                            successAttribute);
                    }
                    else
                    {
                        context.ReportDiagnostic(Diagnostic.Create(
                            new(
                                "OA0002",
                                "Expected IRequest<T> to be IRequest<IOneOf>",
                                "{0} should return IOneOf instead of {1}",
                                "OpenApi.Generator",
                                DiagnosticSeverity.Error,
                                true
                            ),
                            localDeclaration.GetLocation(),
                            requestSymbol.ToString(),
                            typeArgument.Name
                        ));
                    }

                    break;
                }
                if (actionInfo is null) continue;

                var name = method.Name;
                var returnType = method.ReturnType.ToString();
                var parameters = method.Parameters.Select(x => new Parameter(x.Type.ToString(), x.Name));
                var methodInfo = new MethodInfo(name, returnType, parameters, actionInfo);

                members.Add(methodInfo);
            }

            yield return new(namespaceName, className, members, classDeclaration);
        }
    }

    /// <summary>
    /// Gets the namespace where the <paramref name="syntaxNode"/> is declared
    /// </summary>
    /// <param name="syntaxNode"></param>
    /// <returns>Namespace</returns>
    private static string GetNamespace(SyntaxNode syntaxNode)
    {
        // Determine the namespace the class is declared in, if any
        var nameSpace = string.Empty;
        var potentialNamespaceParent = syntaxNode.Parent;
        while (potentialNamespaceParent != null &&
               potentialNamespaceParent is not (NamespaceDeclarationSyntax
                   or FileScopedNamespaceDeclarationSyntax))
        {
            potentialNamespaceParent = potentialNamespaceParent.Parent;
        }
        if (potentialNamespaceParent is not BaseNamespaceDeclarationSyntax namespaceParent)
            return nameSpace;

        nameSpace = namespaceParent.Name.ToString();
        while (true)
        {
            if (namespaceParent.Parent is not NamespaceDeclarationSyntax parent)
                break;

            namespaceParent = parent;
            nameSpace = $"{namespaceParent.Name}.{nameSpace}";
        }

        return nameSpace;
    }
}