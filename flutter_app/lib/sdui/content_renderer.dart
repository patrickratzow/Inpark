import "package:flutter/material.dart";
import "package:flutter_app/sdui/renderer.dart";

import "parser/parser.dart";
import "transformers/transformer.dart";

class ContentRenderer {
  Widget render(String input, BuildContext context, ParserData data) {
    // Reset stack
    Transformer.clearScope();

    final parser = Parser();
    final element = parser.parse(input, "demo", data);
    final renderer = Renderer(element);
    final widget = renderer.render(element, context);

    return widget;
  }
}
