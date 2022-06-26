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

    final left = double.tryParse(element.getAttribute("left")?.value ?? "0");
    final top = double.tryParse(element.getAttribute("top")?.value ?? "0");
    final right = double.tryParse(element.getAttribute("right")?.value ?? "0");
    final bottom =
        double.tryParse(element.getAttribute("bottom")?.value ?? "0");
    final width = double.tryParse(element.getAttribute("width")?.value ?? "0");
    final height =
        double.tryParse(element.getAttribute("height")?.value ?? "0");

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
