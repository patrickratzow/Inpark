import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/node_element.dart";
import "transformer.dart";

class HeroTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("Hero");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final tag = element.getAttribute("tag")?.value ?? "unknown_tag";

    return Hero(
      tag: tag,
      child: Transformer.transformOne(element.children.first, context)!,
    );
  }
}
