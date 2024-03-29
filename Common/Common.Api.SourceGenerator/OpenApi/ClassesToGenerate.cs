﻿using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace Zeta.Common.Api.SourceGenerator.OpenApi;

public record ClassesToGenerate(string NamespaceName, string ClassName, List<MethodInfo> Methods,
    ClassDeclarationSyntax ClassDeclarationSyntax);