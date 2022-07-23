import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/node_element.dart";
import "transformer.dart";

class AlignTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("Align");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final alignment = element.resolveAttribute<Alignment>(
      "alignment",
      context,
      Alignment.center,
    );

    return Align(
      alignment: alignment,
      child: Transformer.transformOne(element.children.first, context),
    );
  }
}
