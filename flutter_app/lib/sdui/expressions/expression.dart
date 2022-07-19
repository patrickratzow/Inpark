import 'package:flutter/foundation.dart';

enum ExpressionType {
  add("+"),
  divide("/"),
  multiply("*"),
  subtract("-"),
  andAlso("&&"),
  orElse("||"),
  equal("=="),
  notEqual("!="),
  greaterThanOrEqual(">="),
  greaterThan(">"),
  lessThan("<"),
  lessThanOrEqual("<="),
  modulo("%");

  final String operator;

  const ExpressionType(this.operator);
}

enum ExpressionNodeType {
  binary,
  constant,
}

@immutable
abstract class Expression {
  abstract final ExpressionNodeType nodeType;

  const Expression();

  static ConstantExpression constant(dynamic value) =>
      ConstantExpression(value);

  static BinaryExpression binary(
    ExpressionType type,
    Expression left,
    Expression right,
  ) {
    return BinaryExpression(type: type, left: left, right: right);
  }
}

@immutable
class ConstantExpression extends Expression {
  @override
  final ExpressionNodeType nodeType = ExpressionNodeType.constant;

  final dynamic value;

  const ConstantExpression(this.value);

  @override
  String toString() => "$value";
}

@immutable
class BinaryExpression extends Expression {
  @override
  final ExpressionNodeType nodeType = ExpressionNodeType.binary;

  final ExpressionType type;
  final Expression left;
  final Expression right;

  const BinaryExpression({
    required this.type,
    required this.left,
    required this.right,
  });

  @override
  String toString() {
    final leftValue = left.toString();
    final rightValue = right.toString();
    final operator = type.operator;

    return "$leftValue $operator $rightValue";
  }
}
