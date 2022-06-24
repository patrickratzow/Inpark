import 'package:flutter/material.dart';

import '../elements/attribute.dart';
import 'attribute_resolver.dart';

class AxisDirectionResolver extends AttributeResolver<AxisDirection> {
  @override
  bool shouldResolve(Attribute attribute) => attribute.name == "axisDirection";

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "up") return AxisDirection.up;
    if (value == "down") return AxisDirection.down;
    if (value == "left") return AxisDirection.left;
    if (value == "right") return AxisDirection.right;

    return null;
  }
}
