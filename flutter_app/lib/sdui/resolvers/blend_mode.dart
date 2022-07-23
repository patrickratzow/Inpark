import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/attribute.dart";
import "attribute_resolver.dart";

class BlendModeResolver extends AttributeResolver<BlendMode> {
  @override
  bool shouldResolve(Attribute attribute) =>
      attribute.name.equalsIgnoreCase("blend-mode");

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "color") return BlendMode.color;
    if (value == "clear") return BlendMode.clear;
    if (value == "dst") return BlendMode.dst;
    if (value == "dstATop") return BlendMode.dstATop;
    if (value == "dstIn") return BlendMode.dstIn;
    if (value == "dstOut") return BlendMode.dstOut;
    if (value == "dstOver") return BlendMode.dstOver;
    if (value == "luminosity") return BlendMode.luminosity;
    if (value == "modulate") return BlendMode.modulate;
    if (value == "multiply") return BlendMode.multiply;
    if (value == "overlay") return BlendMode.overlay;
    if (value == "plus") return BlendMode.plus;
    if (value == "src") return BlendMode.src;
    if (value == "srcATop") return BlendMode.srcATop;
    if (value == "srcIn") return BlendMode.srcIn;
    if (value == "srcOut") return BlendMode.srcOut;
    if (value == "srcOver") return BlendMode.srcOver;
    if (value == "xor") return BlendMode.xor;
    if (value == "darken") return BlendMode.darken;

    return BlendMode.color;
  }
}
