import 'expression.dart';

class ExpressionEvaluator {
  static final _expressionEvaluator = ExpressionEvaluator._internal();

  factory ExpressionEvaluator() => _expressionEvaluator;

  ExpressionEvaluator._internal();

  dynamic evaluate(Expression expression) {
    if (expression is ConstantExpression) return expression.value;
    if (expression is BinaryExpression) {
      return _evaluateBinaryExpression(expression);
    }

    throw UnsupportedError(
        'Unsupported expression type: ${expression.runtimeType}');
  }

  dynamic _evaluateBinaryExpression(BinaryExpression expression) {
    final left = evaluate(expression.left);
    final right = evaluate(expression.right);
    switch (expression.type) {
      case ExpressionType.add:
        return left + right;
      case ExpressionType.divide:
        return left / right;
      case ExpressionType.multiply:
        return left * right;
      case ExpressionType.subtract:
        return left - right;
      case ExpressionType.andAlso:
        return left && right;
      case ExpressionType.orElse:
        return left || right;
      case ExpressionType.equal:
        return left == right;
      case ExpressionType.notEqual:
        return left != right;
      case ExpressionType.greaterThan:
        return left > right;
      case ExpressionType.greaterThanOrEqual:
        return left >= right;
      case ExpressionType.lessThan:
        return left < right;
      case ExpressionType.lessThanOrEqual:
        return left <= right;
      case ExpressionType.modulo:
        return left % right;
      default:
        throw UnsupportedError(
            'Unsupported expression type: ${expression.type}');
    }
  }
}
