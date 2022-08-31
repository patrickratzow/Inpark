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
    return RichText(
      text: TextSpan(
        style: getTextStyle(element, context),
        children: element.children
            .map(
              (element) => TextSpan(
                text: element.innerText,
                style: getTextStyle(element, context),
              ),
            )
            .toList(),
      ),
    );
  }

  FontStyle? getFontStyle(NodeElement element, BuildContext context) {
    final attribute = element.getAttribute("font-style");
    if (attribute == null) return null;

    switch (attribute.value) {
      case "italic":
        return FontStyle.italic;
      case "normal":
        return FontStyle.normal;
      default:
        return null;
    }
  }

  TextStyle getTextStyle(NodeElement element, BuildContext context) {
    final textStyle = getTextStyleFromTheme(element, context) ??
        Theme.of(context).textTheme.bodyMedium!;
    final fontStyle = getFontStyle(element, context);
    final fontWeight = getFontWeight(element, textStyle);

    return textStyle.copyWith(
      fontStyle: fontStyle,
      fontWeight: fontWeight,
    );
  }

  FontWeight? getFontWeight(NodeElement element, TextStyle? style) {
    final fontWeight = element.getAttribute("weight")?.value;
    if (fontWeight == null) return style?.fontWeight ?? FontWeight.normal;
    if (fontWeight == "normal") return FontWeight.normal;
    if (fontWeight == "bold") return FontWeight.bold;

    return FontWeight.values.firstWhere(
      (f) => f.toString() == fontWeight,
      orElse: () => FontWeight.normal,
    );
  }

  TextStyle? getTextStyleFromTheme(NodeElement element, BuildContext context) {
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
