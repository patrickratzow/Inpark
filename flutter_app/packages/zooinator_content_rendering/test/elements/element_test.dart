import 'package:flutter_test/flutter_test.dart';

import '../node_element_builder.dart';

void main() {
  test('should find via element name', () {
    // Arrange
    final element = NodeElementBuilder("row")
        .addChild(
          NodeElementBuilder("text").setInnerText("Hello World").build(),
        )
        .build();

    // Act
    final result = element.find("text");

    // Assert
    expect(result.length, 1);
    expect(result.first.name, "text");
    expect(result.first.innerText, "Hello World");
  });

  test('should find via id', () {
    // Arrange
    final element = NodeElementBuilder("row")
        .addChild(
          NodeElementBuilder("text")
              .addAttribute("id", "hello")
              .setInnerText("Hello World")
              .build(),
        )
        .build();

    // Act
    final result = element.find("#hello");

    // Assert
    expect(result.length, 1);
    expect(result.first.name, "text");
    expect(result.first.innerText, "Hello World");
  });
}
