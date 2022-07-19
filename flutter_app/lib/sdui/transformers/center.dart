import 'package:flutter/material.dart';

import '../elements/node_element.dart';
import 'transformer.dart';

class CenterTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) => element.name == "Center";

  @override
  Widget transform(NodeElement element, BuildContext context) {
    if (element.children.isEmpty) return const Center();

    return Center(
      child: Transformer.transformOne(element.children.first, context),
    );
  }
}
