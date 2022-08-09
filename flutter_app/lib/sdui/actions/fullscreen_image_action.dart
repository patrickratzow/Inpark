import "package:flutter/material.dart" show BuildContext;
import "package:flutter_app/extensions/string.dart";

import "../../common/ui/fullscreen_image.dart";
import "../../hooks/hooks.dart";
import "action.dart";

class FullscreenImageAction extends Action {
  @override
  bool shouldRun(String actionName) =>
      actionName.equalsIgnoreCase("fullscreenImage");

  @override
  void run(BuildContext context, input) {
    final navigator = useNavigator(context: context);
    final previewImage = input["previewImageUrl"] as String;
    final fullscreenImage = input["fullscreenImageUrl"] as String?;
    final tag = input["tag"] as String;
    final title = input["title"] as String;
    final hide = input["hide"] as bool;

    final screen = FullScreenImage(
      imageUrl: fullscreenImage ?? previewImage,
      tag: tag,
      title: title,
    );

    navigator.push(
      context,
      screen,
      hide: hide,
    );
  }
}
