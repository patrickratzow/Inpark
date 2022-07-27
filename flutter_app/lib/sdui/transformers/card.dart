import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/node_element.dart";
import "transformer.dart";

class CardTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("Card");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final borderRadius = element.resolveAttribute<BorderRadius>(
      "border-radius",
      context,
      BorderRadius.zero,
    );
    final margin = element.resolveAttribute<EdgeInsets>(
      "margin",
      context,
      EdgeInsets.zero,
    );
    final clip = element.resolveAttribute<Clip>(
      "clip",
      context,
      Clip.none,
    );

    return Card(
      margin: margin,
      clipBehavior: clip,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: Transformer.transformOne(element.children.first, context),
    );
  }
}
