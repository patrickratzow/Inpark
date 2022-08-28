import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/node_element.dart";
import "transformer.dart";

class TextSpanTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("TextSpan");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final text = element.innerText;
    final textStyle = getTextStyle(element, context) ??
        Theme.of(context).textTheme.bodyMedium!;

    return RichText(
      text: TextSpan(
        style: textStyle,
        text: element.innerText,
      ),
    );
  }

  TextStyle? getTextStyle(NodeElement element, BuildContext context) {
    final style = element.getAttribute("style");
    if (style == null) return null;

    final theme = Theme.of(context);
    switch (style.value) {
      case "displayLarge":
        return theme.textTheme.displayLarge;
      case "displayMedium":
        return theme.textTheme.displayMedium;
      case "displaySmall":
        return theme.textTheme.displaySmall;
      case "headlineLarge":
        return theme.textTheme.headlineLarge;
      case "headlineMedium":
        return theme.textTheme.headlineMedium;
      case "headlineSmall":
        return theme.textTheme.headlineSmall;
      case "bodyLarge":
        return theme.textTheme.bodyLarge;
      case "bodyMedium":
        return theme.textTheme.bodyMedium;
      case "bodySmall":
        return theme.textTheme.bodySmall;
      default:
        return null;
    }
  }
}
