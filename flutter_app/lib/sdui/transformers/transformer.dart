import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_app/sdui/transformers/padding.dart";
import "package:flutter_app/sdui/transformers/scaffold.dart";

import "../elements/node_element.dart";
import "../transformer_filters/transformer_filter.dart";
import "center.dart";
import "column.dart";
import "component.dart";
import "container.dart";
import "text.dart";

abstract class PreTransformer {
  Widget? build(
    Transformer transformer,
    NodeElement element,
    BuildContext context,
  );
}

abstract class Transformer {
  static Set<PreTransformer> preTransformers = {};

  static Set<Transformer> transformers = {
    ComponentTransformer(),
    TextTransformer(),
    CenterTransformer(),
    PaddingTransformer(),
    ScaffoldTransformer(),
    ColumnTransformer(),
    ContainerTransformer(),
  };

  bool shouldTransform(NodeElement element);
  Widget transform(NodeElement element, BuildContext context);

  static Widget? transformOne(NodeElement element, BuildContext context) {
    if (element.name == "Component") {
      _registerComponent(element);

      return null;
    }

    try {
      final filtered = transformers.where(
        (transformer) => TransformerFilter.filter(element),
      );
      if (filtered.isEmpty) return null;
      final transformer = filtered.firstWhere(
        (transformer) => transformer.shouldTransform(element),
      );

      Widget? widget;
      for (final preTransformer in preTransformers) {
        widget = preTransformer.build(transformer, element, context);
      }

      widget ??= transformer.transform(element, context);

      return widget;
    } on StateError catch (_) {
      log("No transformer found for element type: ${element.name}");

      return null;
    }
  }

  static List<Widget> transformAll(
    List<NodeElement> elements,
    BuildContext context,
  ) {
    return elements
        .map((element) => transformOne(element, context))
        .where((element) => element != null)
        .cast<Widget>()
        .toList();
  }

  static void _registerComponent(NodeElement element) {
    ComponentTransformer.registerComponentNode(
      element.name,
      element.children.first,
    );
  }
}
