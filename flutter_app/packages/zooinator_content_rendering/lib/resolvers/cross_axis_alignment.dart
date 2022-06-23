import 'package:flutter/material.dart';

import '../elements/attribute.dart';
import 'attribute_resolver.dart';

class CrossAxisAlignmentResolver extends AttributeResolver<CrossAxisAlignment> {
  @override
  bool shouldResolve(Attribute attribute) =>
      attribute.name == "crossAxisAlignment";

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "start") return CrossAxisAlignment.start;
    if (value == "end") return CrossAxisAlignment.end;
    if (value == "center") return CrossAxisAlignment.center;
    if (value == "stretch") return CrossAxisAlignment.stretch;
    if (value == "baseline") return CrossAxisAlignment.baseline;

    return null;
  }
}
