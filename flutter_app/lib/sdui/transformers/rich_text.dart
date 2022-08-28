import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/node_element.dart";
import "transformer.dart";

class RichTextTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("RichText");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final children = element.children
        .where((child) => child.name.equalsIgnoreCase("TextSpan"))
        .map((child) => Transformer.transformOne(child, context))
        .where((child) => child != null)
        .cast<RichText>()
        .map((richText) => richText.text)
        .toList();

    return RichText(
      text: TextSpan(children: children),
    );
  }
}
