import "package:flutter/material.dart";

import "../elements/attribute.dart";
import "attribute_resolver.dart";

class EdgeInsetsResolver extends AttributeResolver<EdgeInsets> {
  @override
  bool shouldResolve(Attribute attribute) =>
      attribute.name == "padding" || attribute.name == "margin";

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value.split(",");
    if (value.length > 4) {
      throw "Invalid padding value: ${attribute.value}";
    }

    final double left =
        (value.length >= 1 ? double.tryParse(value[0]) : 0) ?? 0;
    final double top = (value.length >= 2 ? double.tryParse(value[1]) : 0) ?? 0;
    final double right =
        (value.length >= 3 ? double.tryParse(value[2]) : 0) ?? 0;
    final double bottom =
        (value.length >= 4 ? double.tryParse(value[3]) : 0) ?? 0;

    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }
}
