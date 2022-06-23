import 'package:flutter_test/flutter_test.dart';
import 'package:zooinator_content_rendering/expressions/evaluator.dart';
import 'package:zooinator_content_rendering/expressions/expression.dart';

void main() {
  // ExpressionType.add
  test('should evaluate add expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.add,
      left: ConstantExpression(1),
      right: ConstantExpression(2),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, 3);
  });

  // ExpressionType.subtract
  test('should evaluate subtract expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.subtract,
      left: ConstantExpression(3),
      right: ConstantExpression(2),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, 1);
  });

  // ExpressionType.multiply
  test('should evaluate multiply expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.multiply,
      left: ConstantExpression(3),
      right: ConstantExpression(2),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, 6);
  });

  // ExpressionType.divide
  test('should evaluate divide expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.divide,
      left: ConstantExpression(6),
      right: ConstantExpression(2),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, 3);
  });

  // ExpressionType.andAlso
  test('should evaluate andAlso expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.andAlso,
      left: ConstantExpression(true),
      right: ConstantExpression(true),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, true);
  });

  // ExpressionType.orElse
  test('should evaluate orElse expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.orElse,
      left: ConstantExpression(false),
      right: ConstantExpression(true),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, true);
  });

  // ExpressionType.equal
  test('should evaluate equal expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.equal,
      left: ConstantExpression(1),
      right: ConstantExpression(1),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, true);
  });

  // ExpressionType.notEqual
  test('should evaluate notEqual expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.notEqual,
      left: ConstantExpression(1),
      right: ConstantExpression(2),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, true);
  });

  // ExpressionType.greaterThan
  test('should evaluate greaterThan expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.greaterThan,
      left: ConstantExpression(1),
      right: ConstantExpression(0),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, true);
  });

  // ExpressionType.greaterThanOrEqual
  test('should evaluate greaterThanOrEqual expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.greaterThanOrEqual,
      left: ConstantExpression(1),
      right: ConstantExpression(1),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, true);
  });

  // ExpressionType.lessThan
  test('should evaluate lessThan expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.lessThan,
      left: ConstantExpression(1),
      right: ConstantExpression(2),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, true);
  });

  // ExpressionType.lessThanOrEqual
  test('should evaluate lessThanOrEqual expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.lessThanOrEqual,
      left: ConstantExpression(1),
      right: ConstantExpression(1),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, true);
  });

  // ExpressionType.modulo
  test('should evaluate modulo expression', () {
    // Arrange
    const expression = BinaryExpression(
      type: ExpressionType.modulo,
      left: ConstantExpression(3),
      right: ConstantExpression(2),
    );
    final evaluator = ExpressionEvaluator();

    // Act
    final result = evaluator.evaluate(expression);

    // Assert
    expect(result, 1);
  });
}
