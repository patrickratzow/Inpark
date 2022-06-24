import "package:flutter/material.dart";

import "../elements/attribute.dart";
import "attribute_resolver.dart";

class AlignmentResolver extends AttributeResolver<Alignment> {
  @override
  bool shouldResolve(Attribute attribute) => attribute.name == "alignment";

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "topLeft") return Alignment.topLeft;
    if (value == "topCenter") return Alignment.topCenter;
    if (value == "topRight") return Alignment.topRight;
    if (value == "centerLeft") return Alignment.centerLeft;
    if (value == "center") return Alignment.center;
    if (value == "centerRight") return Alignment.centerRight;
    if (value == "bottomLeft") return Alignment.bottomLeft;
    if (value == "bottomCenter") return Alignment.bottomCenter;
    if (value == "bottomRight") return Alignment.bottomRight;

    return null;
  }
}
