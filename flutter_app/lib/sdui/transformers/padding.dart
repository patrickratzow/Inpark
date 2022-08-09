import "package:flutter/material.dart";

import "../elements/node_element.dart";
import "transformer.dart";

class PaddingTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) => element.name == "Padding";

  @override
  Widget transform(NodeElement element, BuildContext context) {
    EdgeInsets padding = EdgeInsets.zero;
    final all = element.getAttribute("all");
    if (all != null) {
      padding = EdgeInsets.all(double.tryParse(all.value) ?? 0);
    }
    final left = element.getAttribute("left");
    if (left != null) {
      padding = padding.copyWith(left: double.tryParse(left.value) ?? 0);
    }
    final right = element.getAttribute("right");
    if (right != null) {
      padding = padding.copyWith(right: double.tryParse(right.value) ?? 0);
    }
    final top = element.getAttribute("top");
    if (top != null) {
      padding = padding.copyWith(top: double.tryParse(top.value) ?? 0);
    }
    final bottom = element.getAttribute("bottom");
    if (bottom != null) {
      padding = padding.copyWith(bottom: double.tryParse(bottom.value) ?? 0);
    }

    return Padding(
      padding: padding,
      child: element.children.length != 0
          ? Transformer.transformAll(element.children, context).first
          : null,
    );
  }
}
