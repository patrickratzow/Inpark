import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/node_element.dart";
import "transformer.dart";

class StackTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("Stack");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    return Stack(
      children: Transformer.transformAll(element.children, context),
    );
  }
}
