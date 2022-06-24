import 'package:flutter/material.dart';

import '../elements/attribute.dart';
import 'attribute_resolver.dart';

class TextBaselineResolver extends AttributeResolver<TextBaseline> {
  @override
  bool shouldResolve(Attribute attribute) => attribute.name == "textBaseline";

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "alphabetic") return TextBaseline.alphabetic;
    if (value == "ideographic") return TextBaseline.ideographic;

    return null;
  }
}
