import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/attribute.dart";
import "attribute_resolver.dart";

class ClipResolver extends AttributeResolver<Clip> {
  @override
  bool shouldResolve(Attribute attribute) =>
      attribute.name.equalsIgnoreCase("clip");

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "hardEdge") return Clip.hardEdge;
    if (value == "antiAlias") return Clip.antiAlias;
    if (value == "antiAliasWithSaveLayer") return Clip.antiAliasWithSaveLayer;

    return Clip.none;
  }
}
