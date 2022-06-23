import 'package:flutter/foundation.dart';

enum TokenName {
  literal,
  operator,
  keyword,
  separator,
  identifier,
}

@immutable
class Token {
  final TokenName name;
  final String value;

  const Token(this.name, this.value);
}

class Tokenizer extends Iterable<Token> {
  final String _input;

  Tokenizer(this._input);

  @override
  Iterator<Token> get iterator => TokenizerIterable(_input);
}

class TokenizerIterable extends Iterator<Token> {
  static final RegExp _whitespaceRegex = RegExp(r"\s");

  final String _input;
  Token? _currentToken;
  int _cursorPosition = 0;

  TokenizerIterable(this._input);

  @override
  Token get current {
    if (_currentToken == null) {
      throw "There is no current token. Call moveNext() first";
    }

    return _currentToken!;
  }

  @override
  bool moveNext() {
    _trimSpaces();
    if (_cursorPosition >= _input.length) {
      return false;
    }
    if (_scanIdentifier()) return true;
    if (_scanLiteral()) return true;
    if (_scanOperator()) return true;

    _resetCurrent();
    return false;
  }

  void _trimSpaces() {
    while (_cursorPosition < _input.length &&
        _whitespaceRegex.hasMatch(_input[_cursorPosition])) {
      _cursorPosition++;
    }
  }

  bool _scanIdentifier() {
    var character = _input[_cursorPosition];
    final regex = RegExp(r"[a-zA-Z_0-9]");
    // Can't start with a number, but after the start it's okay
    if (RegExp(r"[0-9]").hasMatch(character)) return false;
    if (!regex.hasMatch(character)) return false;

    final buffer = StringBuffer();
    buffer.write(character);
    _advance(1);

    while (_canAdvance()) {
      character = _input[_cursorPosition];
      if (!regex.hasMatch(character)) break;

      buffer.write(character);
      _advance(1);
    }

    _currentToken = Token(TokenName.identifier, buffer.toString());

    return true;
  }

  bool _scanOperator() {
    if (_consume("+")) {
      if (_consume("=")) {
        _currentToken = const Token(TokenName.operator, "+=");
      } else if (_consume("+")) {
        _currentToken = const Token(TokenName.operator, "++");
      } else {
        _currentToken = const Token(TokenName.operator, "+");
      }

      return true;
    } else if (_consume("-")) {
      if (_consume("=")) {
        _currentToken = const Token(TokenName.operator, "-=");
      } else if (_consume("-")) {
        _currentToken = const Token(TokenName.operator, "--");
      } else {
        _currentToken = const Token(TokenName.operator, "-");
      }

      return true;
    } else if (_consume("/")) {
      if (_consume("=")) {
        _currentToken = const Token(TokenName.operator, "/=");
      } else {
        _currentToken = const Token(TokenName.operator, "/");
      }

      return true;
    } else if (_consume("*")) {
      if (_consume("=")) {
        _currentToken = const Token(TokenName.operator, "*=");
      } else {
        _currentToken = const Token(TokenName.operator, "*");
      }

      return true;
    } else if (_consume("%")) {
      _currentToken = const Token(TokenName.operator, "%");

      return true;
    } else if (_consume("==")) {
      _currentToken = const Token(TokenName.operator, "==");

      return true;
    } else if (_consume("!")) {
      if (_consume("=")) {
        _currentToken = const Token(TokenName.operator, "!=");
      } else {
        _currentToken = const Token(TokenName.operator, "!");
      }

      return true;
    } else if (_consume("<")) {
      if (_consume("=")) {
        _currentToken = const Token(TokenName.operator, "<=");
      } else {
        _currentToken = const Token(TokenName.operator, "<");
      }

      return true;
    } else if (_consume(">")) {
      if (_consume("=")) {
        _currentToken = const Token(TokenName.operator, ">=");
      } else {
        _currentToken = const Token(TokenName.operator, ">");
      }

      return true;
    } else if (_consume("&")) {
      if (_consume("&")) {
        _currentToken = const Token(TokenName.operator, "&&");
      } else {
        _currentToken = const Token(TokenName.operator, "&");
      }

      return true;
    } else if (_consume("|")) {
      if (_consume("|")) {
        _currentToken = const Token(TokenName.operator, "||");
      } else {
        _currentToken = const Token(TokenName.operator, "|");
      }

      return true;
    } else if (_consume("^")) {
      _currentToken = const Token(TokenName.operator, "^");

      return true;
    }

    return false;
  }

  bool _scanLiteral() {
    final buffer = StringBuffer();

    // Handle string literals
    if (_consumeQuote()) {
      buffer.write('"');

      while (_canAdvance()) {
        buffer.write(_input[_cursorPosition]);
        _advance(1);

        if (_consumeQuote()) {
          break;
        }
      }
    }
    // Handle boolean literals
    if (_consume("true")) {
      buffer.write("true");
    } else if (_consume("false")) {
      buffer.write("false");
    }
    // Handle number literals
    var number = _parseNumber();
    if (number != null) {
      buffer.write(number);
    }

    if (buffer.isEmpty) return false;

    _currentToken = Token(TokenName.literal, buffer.toString());

    return true;
  }

  bool _consumeQuote() => _consume('"') || _consume("'");

  bool _consume(String text) {
    var length = text.length;
    if (text.length > (_input.length - _cursorPosition)) {
      return false;
    }
    if (_input.substring(_cursorPosition, _cursorPosition + length) == text) {
      _advance(length);

      return true;
    }

    return false;
  }

  bool _expect(String text) {
    if (_consume(text)) {
      _rewind(text.length);

      return true;
    }

    return false;
  }

  bool _resetCurrent() {
    _currentToken = null;

    return true;
  }

  _advance(int offset) {
    _cursorPosition += offset;
  }

  _rewind(int amount) {
    if (_cursorPosition - amount < 0) throw Exception("Cannot rewind past 0");

    _cursorPosition -= amount;
  }

  bool _canAdvance() {
    return _cursorPosition < _input.length;
  }

  String? get _nextChar {
    if (_cursorPosition + 1 >= _input.length) return null;

    return _input[_cursorPosition + 1];
  }

  String? _parseNumber() {
    final regex = RegExp(r"[0-9]");
    final buffer = StringBuffer();
    if (_expect("-")) {
      final nextChar = _nextChar;
      if (nextChar == null || !regex.hasMatch(nextChar)) {
        return null;
      }

      buffer.write("-");
      _advance(1);
    }

    var hasEnteredDigit = false;
    while (_canAdvance()) {
      final char = _input[_cursorPosition];
      if (char == ".") {
        if (hasEnteredDigit) {
          return null;
        }

        hasEnteredDigit = true;
        buffer.write(char);
        _advance(1);

        continue;
      } else if (regex.hasMatch(char)) {
        buffer.write(char);
        _advance(1);

        continue;
      } else if (_whitespaceRegex.hasMatch(char)) {
        break;
      }

      return null;
    }

    return buffer.toString();
  }
}
