import 'tokenizer.dart';
import 'expression.dart';

enum ExpressionParserState {
  start,
}

class ExpressionParser {
  final List<Token> tokens;
  Token? _previous;
  Token? _lookahead;
  Expression? _previousExpression;

  ExpressionParser(String input) : tokens = Tokenizer(input).toList();

  Expression parse(String input) {
    for (var i = 0; i < tokens.length; i++) {
      if (i > 0) _previous = tokens[i - 1];
      if (i < tokens.length - 1) {
        _lookahead = tokens[i + 1];
      } else {
        _lookahead = null;
      }

      final token = tokens[i];
      final expression = _parseToken(token);

      _previousExpression = expression;
    }

    if (_previousExpression == null) {
      throw Exception("Unable to parse expression");
    }

    return _previousExpression!;
  }

  Expression _parseToken(Token token) {
    final binaryExpression = _parseBinaryExpression(token);
    return binaryExpression;

    throw "";
  }

  Expression _parseBinaryExpression(Token token) {
    if (token.name == TokenName.literal || token.name == TokenName.identifier) {
      final left = _parseToken(token);
    }

    if (_previous?.name == TokenName.operator) {
      throw SyntaxError(
        "Unable to parse operator, because previous token is an operator. Operator chaining is not allowed",
        token,
        _previousExpression,
      );
    }

    if (_lookahead?.name == TokenName.operator) {
      throw SyntaxError(
        "Unable to parse operator, because next token is an operator. Operator chaining is not allowed",
        token,
        _previousExpression,
      );
    }

    throw "";
  }
}

class SyntaxError extends Error {
  final String message;
  final Token token;
  final Expression? previousExpression;

  SyntaxError(this.message, this.token, this.previousExpression);
}
