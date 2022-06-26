import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/node_element.dart";
import "transformer.dart";

class RowTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("Row");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final crossAxisAlignment = element.resolveAttribute<CrossAxisAlignment>(
      "cross-axis-alignment",
      context,
      CrossAxisAlignment.center,
    );
    final mainAxisAlignment = element.resolveAttribute<MainAxisAlignment>(
      "main-axis-alignment",
      context,
      MainAxisAlignment.start,
    );
    final textDirection = element.resolveAttribute<TextDirection>(
      "text-direction",
      context,
      TextDirection.ltr,
    );
    final verticalDirection = element.resolveAttribute<VerticalDirection>(
      "vertical-direction",
      context,
      VerticalDirection.down,
    );
    final textBaseline = element.resolveAttribute<TextBaseline>(
      "text-baseline",
      context,
      TextBaseline.alphabetic,
    );
    final mainAxisSize = element.resolveAttribute<MainAxisSize>(
      "main-axis-size",
      context,
      MainAxisSize.max,
    );

    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      mainAxisSize: mainAxisSize,
      children: Transformer.transformAll(element.children, context),
    );
  }
}

class ExpandedTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("Expanded");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    return Expanded(
      child: Transformer.transformOne(element.children.first, context)!,
    );
  }
}
