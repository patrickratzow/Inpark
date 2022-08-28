import "package:flutter/material.dart" show BuildContext;
import "package:flutter_app/extensions/string.dart";

import "../../common/browser.dart";
import "../../hooks/hooks.dart";
import "action.dart";

class OpenUrlAction extends Action {
  @override
  bool shouldRun(String actionName) => actionName.equalsIgnoreCase("openUrl");

  @override
  Future run(BuildContext context, input) {
    final navigator = useNavigator(context: context);
    final url = input is String ? input : input?["url"];

    return Browser.openUrl(
      context,
      url,
    );
  }
}
