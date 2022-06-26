import "package:flutter/material.dart" show BuildContext, TextButton, Widget;
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
    final action = _actions.firstWhere(
      (action) => action.shouldRun(name),
      orElse: () => throw Exception("No action found for $name"),
    );

    return () => action.run(context, data);
  }
}

class ButtonTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("Button");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final onPressed = getOnPressed(element, context) ?? () => {};

    return TextButton(
      onPressed: onPressed,
      child: Transformer.transformOne(element.children.first, context)!,
    );
  }

  Function()? getOnPressed(NodeElement element, BuildContext context) {
    final actionService = locator.get<ActionService>();
    final action = element.getAttribute("action")?.value;
    if (action == null)
      throw Exception("Button element must have an action attribute");
    final actionData = element.getAttribute("action-data")?.value;

    return actionService.getAction(context, action, actionData);
  }
}
