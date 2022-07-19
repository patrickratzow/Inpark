import 'package:flutter/material.dart';

import '../elements/attribute.dart';
import 'attribute_resolver.dart';

class TextAlignResolver extends AttributeResolver<TextAlign> {
  @override
  bool shouldResolve(Attribute attribute) => attribute.name == "textAlign";

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "left") return TextAlign.left;
    if (value == "right") return TextAlign.right;
    if (value == "center") return TextAlign.center;
    if (value == "justify") return TextAlign.justify;
    if (value == "start") return TextAlign.start;
    if (value == "end") return TextAlign.end;

    return null;
  }
}
