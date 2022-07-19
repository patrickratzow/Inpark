import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter/src/widgets/framework.dart";

import "../../sdui/elements/node_element.dart";
import "../../sdui/transformers/transformer.dart";

abstract class HookTransformer {}

class HookPreTransformer extends PreTransformer {
  @override
  Widget? build(
    Transformer transformer,
    NodeElement element,
    BuildContext context,
  ) {
    if (transformer is HookTransformer) {
      return HookBuilder(
        builder: (context) => transformer.transform(element, context),
      );
    }

    return null;
  }
}
