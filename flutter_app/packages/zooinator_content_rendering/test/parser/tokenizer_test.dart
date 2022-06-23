import 'package:flutter_test/flutter_test.dart';
import 'package:zooinator_content_rendering/expressions/tokenizer.dart';

void main() {
  group("number", () {
    test('tokenize number as literal', () {
      // Arrange
      const input = "5";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.literal);
      expect(result[0].value, input);
    });

    test('tokenize multi character number as literal', () {
      // Arrange
      const input = "5252";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.literal);
      expect(result[0].value, input);
    });

    test('tokenize number with digit as literal', () {
      // Arrange
      const input = "5.2";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.literal);
      expect(result[0].value, input);
    });

    test("tokenize number starting with period as literal", () {
      // Arrange
      const input = ".5";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.literal);
      expect(result[0].value, input);
    });

    test("tokenize number starting with - as literal", () {
      // Arrange
      const input = "-5";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.literal);
      expect(result[0].value, input);
    });
  });

  group("operator", () {
    test("tokenize + as operator", () {
      // Arrange
      const input = "+";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize - as operator", () {
      // Arrange
      const input = "-";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize * as operator", () {
      // Arrange
      const input = "*";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize / as operator", () {
      // Arrange
      const input = "/";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize % as operator", () {
      // Arrange
      const input = "%";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize ^ as operator", () {
      // Arrange
      const input = "^";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize & as operator", () {
      // Arrange
      const input = "&";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize && as operator", () {
      // Arrange
      const input = "&&";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize || as operator", () {
      // Arrange
      const input = "||";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize ! as operator", () {
      // Arrange
      const input = "!";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize == as operator", () {
      // Arrange
      const input = "==";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize != as operator", () {
      // Arrange
      const input = "!=";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize < as operator", () {
      // Arrange
      const input = "<";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize <= as operator", () {
      // Arrange
      const input = "<=";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize > as operator", () {
      // Arrange
      const input = ">";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });

    test("tokenize > as operator", () {
      // Arrange
      const input = ">=";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.operator);
      expect(result[0].value, input);
    });
  });

  group("identifier", () {
    test("tokenize identifier", () {
      // Arrange
      const input = "length";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 1);
      expect(result[0].name, TokenName.identifier);
      expect(result[0].value, input);
    });
  });

  group("compound", () {
    test("5 + 15", () {
      // Arrange
      const input = "5 + 15";
      final tokenizer = Tokenizer(input);

      // Act
      var result = tokenizer.toList();

      // Assert
      expect(result.length, 3);
      expect(result[0].name, TokenName.literal);
      expect(result[0].value, "5");
      expect(result[1].name, TokenName.operator);
      expect(result[1].value, "+");
      expect(result[2].name, TokenName.literal);
      expect(result[2].value, "15");
    });
  });
}
