class Attribute {
  final String name;
  final String value;

  const Attribute(this.name, this.value);

  @override
  bool operator ==(Object other) => other is Attribute && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
