import "package:flutter/material.dart";
import "package:flutter_app/extensions/string.dart";

import "../elements/attribute.dart";
import "attribute_resolver.dart";

class BoxFitResolver extends AttributeResolver<BoxFit> {
  @override
  bool shouldResolve(Attribute attribute) =>
      attribute.name.equalsIgnoreCase("fit");

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "contain") return BoxFit.contain;
    if (value == "cover") return BoxFit.cover;
    if (value == "fill") return BoxFit.fill;
    if (value == "fitWidth") return BoxFit.fitWidth;
    if (value == "fitHeight") return BoxFit.fitHeight;
    if (value == "none") return BoxFit.none;
    if (value == "scaleDown") return BoxFit.scaleDown;

    return BoxFit.cover;
  }
}
