import 'package:flutter/material.dart';

import '../elements/node_element.dart';
import 'transformer.dart';

class ColumnTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) => element.name == "Column";

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final mainAxisAlignment = element.resolveAttribute<MainAxisAlignment>(
      "mainAxisAlignment",
      context,
      MainAxisAlignment.start,
    );
    final mainAxisSize = element.resolveAttribute<MainAxisSize>(
      "mainAxisSize",
      context,
      MainAxisSize.max,
    );
    final crossAxisAlignment = element.resolveAttribute<CrossAxisAlignment>(
      "crossAxisAlignment",
      context,
      CrossAxisAlignment.center,
    );
    final textDirection = element.resolveAttribute<TextDirection>(
      "textDirection",
      context,
      TextDirection.ltr,
    );
    final textBaseline = element.resolveAttribute<TextBaseline>(
      "textBaseline",
      context,
      TextBaseline.alphabetic,
    );
    final verticalDirection = element.resolveAttribute<VerticalDirection>(
      "verticalDirection",
      context,
      VerticalDirection.down,
    );

    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      textBaseline: textBaseline,
      verticalDirection: verticalDirection,
      children: Transformer.transformAll(element.children, context),
    );
  }
}
