import "package:flutter/material.dart";

import "../common/ui/screen_app_bar.dart";
import "../sdui/elements/node_element.dart";
import "../sdui/transformers/transformer.dart";

class ScreenAppBarTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) => element.name == "AppBar";

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final title = element.getAttribute("title")?.value;
    final automaticallyImplyLeading = getAutomaticallyImplyLeading(element);

    return ScreenAppBar(
      title: title,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  bool getAutomaticallyImplyLeading(NodeElement element) {
    final attribute = element.getAttribute("automatically-imply-leading");
    if (attribute == null) return true;

    return attribute.value == "true";
  }
}
