import "package:flutter/material.dart" show BuildContext;
import "package:flutter_app/extensions/string.dart";

import "../../common/ioc.dart";
import "../../hooks/hooks.dart";
import "../screen.dart";
import "action.dart";

class NavigateToScreenAction extends Action {
  @override
  bool shouldRun(String actionName) =>
      actionName.equalsIgnoreCase("navigateToScreen");

  @override
  Future run(BuildContext context, input) {
    final screenManager = locator.get<ScreenManager>();
    final navigator = useNavigator(context: context);
    final routeName = input is String ? input : input?["routeName"];
    final routeBuilder = screenManager.getScreen(routeName, input);
    final hide =
        !(input is String) ? ((input?["hide"] ?? false) as bool) : false;

    if (routeBuilder == null)
      throw Exception("Unable to found route $routeName");

    final screen = routeBuilder(context);

    navigator.push(
      context,
      screen,
      hide: hide,
    );

    return Future.value();
  }
}
