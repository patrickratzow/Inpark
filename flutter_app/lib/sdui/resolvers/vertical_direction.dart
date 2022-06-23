import 'package:flutter/material.dart';

import '../elements/attribute.dart';
import 'attribute_resolver.dart';

class VerticalDirectionResolver extends AttributeResolver<VerticalDirection> {
  @override
  bool shouldResolve(Attribute attribute) =>
      attribute.name == "verticalDirection";

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "up") return VerticalDirection.up;
    if (value == "down") return VerticalDirection.down;

    return null;
  }
}
