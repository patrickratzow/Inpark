import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/node_element.dart";
import "transformer.dart";

class AspectRatioTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("AspectRatio");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final ratio = getRatio(element);

    return AspectRatio(
      aspectRatio: ratio,
      child: Transformer.transformOne(element.children.first, context),
    );
  }

  double getRatio(NodeElement element) {
    final ratio = element.getAttribute("ratio")?.value;
    if (ratio == null) return 1;

    return double.tryParse(ratio) ?? 1;
  }
}
