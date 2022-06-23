import 'package:flutter/material.dart';

import '../elements/node_element.dart';
import 'transformer.dart';

class ContainerTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) => element.name == "Container";

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final height = getHeight(element);
    final width = getWidth(element);

    // ignore: sized_box_for_whitespace
    return Container(
      height: height,
      width: width,
      child: Transformer.transformOne(element.children.first, context),
    );
  }

  double? getHeight(NodeElement element) {
    final height = element.getAttribute("height")?.value;
    if (height == null) return null;
    if (height == "max" || height == "infinity") return double.infinity;

    return double.tryParse(height);
  }

  double? getWidth(NodeElement element) {
    final width = element.getAttribute("width")?.value;
    if (width == null) return null;
    if (width == "max" || width == "infinity") return double.infinity;

    return double.tryParse(width);
  }
}
