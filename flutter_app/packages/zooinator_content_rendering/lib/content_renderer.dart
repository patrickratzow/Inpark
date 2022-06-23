import 'package:flutter/material.dart';
import 'package:zooinator_content_rendering/renderer.dart';

import 'parser/parser.dart';

class ContentRenderer {
  Widget render(String input, BuildContext context, ParserData data) {
    final parser = Parser();
    final element = parser.parse(input, "demo", data);
    final renderer = Renderer(element);
    final widget = renderer.render(element, context);

    return widget;
  }
}
