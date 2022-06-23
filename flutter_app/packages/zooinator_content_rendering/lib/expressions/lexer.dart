import 'package:zooinator_content_rendering/expressions/tokenizer.dart';

class Lexer {
  Iterable<Token> lex(String input) sync* {
    final tokenizer = Tokenizer(input);
    final iterator = tokenizer.iterator;

    while (iterator.moveNext()) {
      yield iterator.current;
    }
  }
}
