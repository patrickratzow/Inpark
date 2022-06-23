import 'package:flutter/material.dart';

import '../elements/attribute.dart';
import 'attribute_resolver.dart';

class MainAxisAlignmentResolver extends AttributeResolver<MainAxisAlignment> {
  @override
  bool shouldResolve(Attribute attribute) =>
      attribute.name == "mainAxisAlignment";

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "start") return MainAxisAlignment.start;
    if (value == "end") return MainAxisAlignment.end;
    if (value == "center") return MainAxisAlignment.center;
    if (value == "spaceBetween") return MainAxisAlignment.spaceBetween;
    if (value == "spaceAround") return MainAxisAlignment.spaceAround;
    if (value == "spaceEvenly") return MainAxisAlignment.spaceEvenly;

    return null;
  }
}
