import 'package:flutter/material.dart';

import '../elements/attribute.dart';
import 'attribute_resolver.dart';

class TextDirectionResolver extends AttributeResolver<TextDirection> {
  @override
  bool shouldResolve(Attribute attribute) => attribute.name == "textDirection";

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "ltr") return TextDirection.ltr;
    if (value == "rtl") return TextDirection.rtl;

    return null;
  }
}
