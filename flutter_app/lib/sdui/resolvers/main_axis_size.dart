import 'package:flutter/material.dart';

import '../elements/attribute.dart';
import 'attribute_resolver.dart';

class MainAxisSizeResolver extends AttributeResolver<MainAxisSize> {
  @override
  bool shouldResolve(Attribute attribute) => attribute.name == "mainAxisSize";

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "max") return MainAxisSize.max;
    if (value == "min") return MainAxisSize.min;

    return null;
  }
}
