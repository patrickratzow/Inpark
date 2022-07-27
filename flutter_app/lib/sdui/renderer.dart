import 'package:flutter/widgets.dart' show BuildContext, Container, Widget;

import 'elements/node_element.dart';
import 'transformers/transformer.dart';

class Renderer {
  final NodeElement element;

  Renderer(this.element);

  Widget render(NodeElement element, BuildContext context) {
    final widget = Container(
      child: Transformer.transformOne(element, context),
    );

    return widget;
  }
}
