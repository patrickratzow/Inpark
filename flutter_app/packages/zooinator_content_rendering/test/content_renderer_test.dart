import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zooinator_content_rendering/content_renderer.dart';
import 'package:zooinator_content_rendering/parser/parser.dart';

void main() {
  testWidgets("render basic xml", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          // Arrange
          const input = """
<text>Hello World</text>
""";
          final renderer = ContentRenderer();
          final data = ParserData();

          // Act
          final result = renderer.render(input, context, data);

          // Assert
          return result;
        },
      ),
    ));
  });
}
