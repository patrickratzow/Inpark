import "../transformers/transformer.dart";

class Attribute {
  final String name;
  final String _value;

  String get value {
    final regex = RegExp(r"\${{(.*)}}");
    if (regex.hasMatch(_value)) {
      final match = regex.firstMatch(_value)!.group(1)!.trim();
      final variable = Transformer.getVariable(match);
      if (variable != null) {
        return variable;
      }
    }

    return _value;
  }

  const Attribute(this.name, this._value);

  @override
  bool operator ==(Object other) => other is Attribute && value == other.value;

  @override
  int get hashCode => value.hashCode;

  double toDouble({double? fallback}) =>
      double.tryParse(value) ?? (fallback ?? 0);
}
