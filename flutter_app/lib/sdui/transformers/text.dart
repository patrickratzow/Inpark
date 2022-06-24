import 'package:flutter/material.dart';

import '../elements/node_element.dart';
import 'transformer.dart';

class TextTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) => element.name == "Text";

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final value = element.innerText;
    final style = getTextStyle(element, context) ?? const TextStyle();
    final fontSize = getFontSize(element, style);
    final fontWeight = getFontWeight(element, style);

    return Text(
      value,
      style: style.copyWith(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  double? getFontSize(NodeElement element, TextStyle? style) {
    final fontSize = element.getAttribute("size");
    if (fontSize == null) return style?.fontSize;

    return double.tryParse(fontSize.value);
  }

  FontWeight? getFontWeight(NodeElement element, TextStyle? style) {
    final fontWeight = element.getAttribute("weight");
    if (fontWeight == null) return style?.fontWeight ?? FontWeight.normal;

    return FontWeight.values.firstWhere(
      (f) => f.toString() == fontWeight.value,
      orElse: () => FontWeight.normal,
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
