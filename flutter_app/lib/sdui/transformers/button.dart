import "dart:convert";

import "package:flutter/material.dart"
    show BuildContext, EdgeInsets, TextButton, Widget;
import "package:flutter_app/extensions/string.dart";

import "../../common/ioc.dart";
import "../actions/action.dart";
import "../actions/navigate_to_screen_action.dart";
import "../elements/node_element.dart";
import "transformer.dart";

class ActionService {
  Set<Action> _actions = {
    NavigateToScreenAction(),
  };

  Function()? getAction(BuildContext context, String name, dynamic data) {
    final parsedData = parseData(data);
    final action = _actions.firstWhere(
      (action) => action.shouldRun(name),
      orElse: () => throw Exception("No action found for $name"),
    );

    return () => action.run(context, parsedData);
  }

  dynamic parseData(dynamic data) {
    try {
      return jsonDecode(data);
    } on FormatException {
      return data;
    }
  }
}

class ButtonTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("Button");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final children =
        element.children.where((child) => child.name != "ActionData").toList();
    final onPressed = getOnPressed(element, context) ?? () => {};
    final padding = element.resolveAttribute<EdgeInsets?>(
      "padding",
      context,
      null,
    );

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: padding,
      ),
      child: Transformer.transformOne(children.first, context)!,
    );
  }

  Function()? getOnPressed(NodeElement element, BuildContext context) {
    final actionService = locator.get<ActionService>();
    final action = element.getAttribute("action")?.value;
    if (action == null)
      throw Exception("Button element must have an action attribute");
    dynamic actionData = element.getAttribute("action-data")?.value;
    if (actionData == null) {
      var actionDataNode = element.findFirst("ActionData");
      actionData = actionDataNode?.innerText;
    }

    return actionService.getAction(context, action, actionData);
  }
}
