import "package:flutter/material.dart"
    show BuildContext, GestureDetector, Widget;
import "package:flutter_app/extensions/string.dart";

import "../../common/ioc.dart";
import "../elements/node_element.dart";
import "button.dart";
import "transformer.dart";

class GestureDetectorTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("GestureDetector");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final children =
        element.children.where((child) => child.name != "ActionData").toList();
    final onTap = getOnTap(element, context) ?? () => {};
    final child = element.children.firstWhere(
      (child) => child.name != "ActionData",
      orElse: () => throw Exception("No child found"),
    );

    return GestureDetector(
      onTap: onTap,
      child: Transformer.transformOne(child, context)!,
    );
  }

  Function()? getOnTap(NodeElement element, BuildContext context) {
    final actionService = locator.get<ActionService>();
    final action = element.getAttribute("on-tap")?.value;
    if (action == null) return null;
    dynamic actionData = element.getAttribute("action-data")?.value;
    if (actionData == null) {
      var actionDataNode = element.findFirst("ActionData");
      actionData = actionDataNode?.innerText;
    }

    return actionService.getAction(context, action, actionData);
  }
}
