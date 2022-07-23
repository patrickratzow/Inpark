import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/node_element.dart";
import "transformer.dart";

class ContainerTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name.equalsIgnoreCase("Container");

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final height = getHeight(element);
    final width = getWidth(element);
    final padding = element.resolveAttribute<EdgeInsets?>(
      "padding",
      context,
      null,
    );
    final margin = element.resolveAttribute<EdgeInsets?>(
      "margin",
      context,
      null,
    );
    final decoration = getDecoration(element, context);

    var children = element.children.map((x) => x);
    if (decoration != null) {
      children = children
          .where((element) => !element.name.equalsIgnoreCase("Decoration"));
    }

    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: children.isEmpty
          ? null
          : Transformer.transformOne(children.first, context),
    );
  }

  double? getHeight(NodeElement element) {
    final height = element.getAttribute("height")?.value;
    if (height == null) return null;
    if (height == "max" || height == "infinity") return double.infinity;

    return double.tryParse(height);
  }

  double? getWidth(NodeElement element) {
    final width = element.getAttribute("width")?.value;
    if (width == null) return null;
    if (width == "max" || width == "infinity") return double.infinity;

    return double.tryParse(width);
  }

  BoxDecoration? getDecoration(NodeElement element, BuildContext context) {
    try {
      final decoration = element.children.firstWhere(
        (child) => child.name.equalsIgnoreCase("Decoration"),
      );
      final gradient = getDecorationGradient(decoration, context);
      // Color
      final colorNode = decoration.findFirst("Color");
      final Color? color =
          colorNode != null ? hexToColor(colorNode.innerText) : null;
      final borderRadius = decoration.resolveAttribute<BorderRadius>(
        "border-radius",
        context,
        BorderRadius.zero,
      );

      return BoxDecoration(
        gradient: gradient,
        color: color,
        borderRadius: borderRadius,
      );
    } catch (e) {
      return null;
    }
  }

  Gradient? getDecorationGradient(NodeElement element, BuildContext context) {
    final linearGradient = element.findFirst("LinearGradient");
    if (linearGradient != null) {
      final begin = linearGradient.resolveAttribute<Alignment>(
        "begin",
        context,
        Alignment.centerLeft,
      );
      final end = linearGradient.resolveAttribute<Alignment>(
        "end",
        context,
        Alignment.centerRight,
      );
      final colorNodes = linearGradient.find("Color");
      final colors = colorNodes
          .map((colorNode) => hexToColor(colorNode.innerText))
          .toList();

      return LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
      );
    }

    return null;
  }

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 9), radix: 16) + 0x00000000);
  }
}
