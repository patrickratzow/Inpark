import "package:flutter/material.dart";

import "../resolvers/attribute_resolver.dart";
import "../transformers/transformer.dart";
import "attribute.dart";

class NodeElement {
  final String name;
  final List<Attribute> attributes;
  final List<NodeElement> children;
  final String _innerText;
  String get innerText {
    final regex = RegExp(r"\${{(.*)}}");
    if (regex.hasMatch(_innerText)) {
      final match = regex.firstMatch(_innerText)!.group(1)!.trim();
      final variable = Transformer.getVariable(match);
      if (variable != null) {
        return variable;
      }
    }

    return _innerText;
  }

  NodeElement? _parent;
  NodeElement? get parent => _parent;
  set parent(NodeElement? value) {
    if (_parent != null) throw Exception("Cannot change parent once set");

    _parent = value;
  }

  NodeElement(
    this.name,
    this.attributes,
    this.children,
    this._innerText,
    this._parent,
  );

  Attribute? getAttribute(String name) {
    return attributes.cast<Attribute?>().firstWhere(
          (attribute) => attribute?.name == name,
          orElse: () => null,
        );
  }

  T resolveAttribute<T>(String name, BuildContext context, T orElse) {
    final attribute = getAttribute(name);
    if (attribute == null) return orElse;

    return AttributeResolver.resolveAttribute(attribute, context) ?? orElse;
  }

  List<NodeElement> find(String selector) {
    final list = <NodeElement>[];

    _findInChildren(selector, list);

    return list;
  }

  NodeElement? findFirst(String selector) {
    final list = <NodeElement>[];

    _findInChildren(selector, list);

    if (list.isEmpty) return null;

    return list.first;
  }

  void _findInChildren(String selector, List<NodeElement> elements) {
    if (selector.startsWith("#")) {
      selector = selector.substring(1);
      for (final child in children) {
        final idAttribute =
            child.attributes.where((element) => element.name == "id");
        if (idAttribute.length == 1 && idAttribute.first.value == selector) {
          elements.add(child);
        }

        child._findInChildren(selector, elements);
      }

      return;
    }

    for (final child in children) {
      if (child.name == selector) {
        elements.add(child);
      }

      child._findInChildren(selector, elements);
    }
  }
}
