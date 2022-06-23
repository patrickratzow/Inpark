import 'package:flutter_test/flutter_test.dart';
import 'package:zooinator_content_rendering/expressions/lexer.dart';
import 'package:zooinator_content_rendering/expressions/tokenizer.dart';

void main() {
  test('lex basic expression', () {
    // Arrange
    const input = "(5) + 15";
    final lexer = Lexer();

    // Act
    final result = lexer.lex(input).toList();

    // Assert
    expect(result.length, 3);
    expect(result[0].name, TokenName.literal);
    expect(result[1].name, TokenName.operator);
    expect(result[2].name, TokenName.literal);
  });
}
