import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/attribute.dart";
import "attribute_resolver.dart";

class BorderRadiusResolver extends AttributeResolver<BorderRadius> {
  @override
  bool shouldResolve(Attribute attribute) =>
      attribute.name.equalsIgnoreCase("border-radius");

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    final circular = value.startsWith("circular(");
    if (circular) {
      final radius = value.substring(9, value.length - 1);

      return BorderRadius.circular(double.tryParse(radius) ?? 0);
    }

    return BorderRadius.zero;
  }
}
