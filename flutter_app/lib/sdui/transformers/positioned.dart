import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/node_element.dart";
import "transformer.dart";

class PositionedTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("Positioned");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final child = Transformer.transformOne(element.children.first, context)!;
    final fill = element.getAttribute("fill")?.value == "true";
    if (fill) {
      return Positioned.fill(
        child: child,
      );
    }

    final left = element.getAttribute("left")?.toDouble();
    final top = element.getAttribute("top")?.toDouble();
    final right = element.getAttribute("right")?.toDouble();
    final bottom = element.getAttribute("bottom")?.toDouble();
    final width = element.getAttribute("width")?.toDouble();
    final height = element.getAttribute("height")?.toDouble();

    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: child,
    );
  }
}
