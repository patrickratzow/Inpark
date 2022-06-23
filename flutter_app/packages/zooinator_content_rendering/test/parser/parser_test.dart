import 'package:flutter_test/flutter_test.dart';
import 'package:zooinator_content_rendering/parser/parser.dart';

void main() {
  test('parse basic XML', () {
    // Arrange
    const input = "<text>Hello World</text>";
    final parser = Parser();
    final data = ParserData();

    // Act
    final result = parser.parse(input, "test", data);

    // Assert
    expect(result, isNotNull);
    expect(result.name, "text");
    expect(result.innerText, "Hello World");
  });

  test('parse attributes', () {
    // Arrange
    const input = '<text size="12">Hello World</text>';
    final parser = Parser();
    final data = ParserData();

    // Act
    final result = parser.parse(input, "test", data);

    // Assert
    expect(result.attributes.length, 1);
    expect(result.attributes.first.name, "size");
    expect(result.attributes.first.value, "12");
  });

  test('parse nested children', () {
    // Arrange
    const input = """
<row>
  <text>Hello</text>
  <text>World</text>
</row>
""";
    final parser = Parser();
    final data = ParserData();

    // Act
    final result = parser.parse(input, "test", data);

    // Assert
    expect(result.children.length, 2);
    expect(result.children.first.name, "text");
    expect(result.children.first.innerText, "Hello");
    expect(result.children.last.name, "text");
    expect(result.children.last.innerText, "World");
  });

  test('resolve data in attributes', () {
    // Arrange
    const input = "<text size=\"\${size}\">Hello World</text>";
    final parser = Parser();
    final data = ParserData()..add("size", "12");

    // Act
    final result = parser.parse(input, "test", data);

    // Assert
    expect(result, isNotNull);
    expect(result.attributes.first.value, "12");
  });
}
