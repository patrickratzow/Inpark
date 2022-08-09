import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_app/sdui/transformers/card.dart";
import "package:flutter_app/sdui/transformers/image.dart";
import "package:flutter_app/sdui/transformers/padding.dart";
import "package:flutter_app/sdui/transformers/positioned.dart";
import "package:flutter_app/sdui/transformers/row.dart";
import "package:flutter_app/sdui/transformers/scaffold.dart";
import "package:flutter_app/sdui/transformers/stack.dart";

import "../../common/stack_collection.dart";
import "../elements/attribute.dart";
import "../elements/node_element.dart";
import "../transformer_filters/transformer_filter.dart";
import "align.dart";
import "aspect_ratio.dart";
import "button.dart";
import "center.dart";
import "column.dart";
import "component.dart";
import "container.dart";
import "gesture_detector.dart";
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
    ButtonTransformer(),
    AspectRatioTransformer(),
    CardTransformer(),
    PositionedTransformer(),
    StackTransformer(),
    ImageTransformer(),
    RowTransformer(),
    ExpandedTransformer(),
    AlignTransformer(),
    GestureDetectorTransformer(),
  };
  static StackCollection<TransformerScope> scopes =
      StackCollection<TransformerScope>();

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

  static TransformerScope beginScope(NodeElement element) {
    final params = element.attributes
        .where((attribute) => attribute.name.startsWith(":"))
        .toList();
    final scope = TransformerScope(params);

    scopes.push(scope);

    return scope;
  }

  static void clearScope() {
    scopes = StackCollection();
  }

  static String? getVariable(String name) {
    for (final scope in scopes) {
      final variable = scope.get(name);
      if (variable == null) continue;

      return variable;
    }

    return null;
  }

  static void popScope() {
    scopes.pop();
  }
}

class TransformerScope {
  final Map<String, Attribute> _data;

  TransformerScope(List<Attribute> data)
      : _data = {
          for (final attribute in data) attribute.name.substring(1): attribute
        };

  String? get(String name) => _data[name]?.value;

  void destroy() {
    Transformer.popScope();
  }
}
