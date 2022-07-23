import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_app/sdui/resolvers/blend_mode.dart";
import "package:flutter_app/sdui/resolvers/clip.dart";
import "package:flutter_app/sdui/resolvers/edge_insets.dart";
import "package:flutter_app/sdui/resolvers/text_align.dart";
import "package:flutter_app/sdui/resolvers/text_baseline.dart";
import "package:flutter_app/sdui/resolvers/text_direction.dart";
import "package:flutter_app/sdui/resolvers/vertical_direction.dart";

import "../elements/attribute.dart";
import "alignment.dart";
import "axis_direction.dart";
import "border_radius.dart";
import "box_fit.dart";
import "cross_axis_alignment.dart";
import "icon_data.dart";
import "main_axis_alignment.dart";
import "main_axis_size.dart";

abstract class AttributeResolver<T> {
  static Set<AttributeResolver> resolvers = {
    AlignmentResolver(),
    AxisDirectionResolver(),
    CrossAxisAlignmentResolver(),
    MainAxisAlignmentResolver(),
    MainAxisSizeResolver(),
    TextAlignResolver(),
    TextBaselineResolver(),
    TextDirectionResolver(),
    VerticalDirectionResolver(),
    IconDataResolver(),
    EdgeInsetsResolver(),
    BorderRadiusResolver(),
    BoxFitResolver(),
    BlendModeResolver(),
    ClipResolver(),
  };

  bool shouldResolve(Attribute attribute);
  T? resolve(Attribute attribute, BuildContext context);

  static dynamic resolveAttribute<T>(
    Attribute attribute,
    BuildContext context,
  ) {
    try {
      return resolvers
          .firstWhere((resolver) => resolver.shouldResolve(attribute))
          .resolve(attribute, context);
    } catch (ex) {
      log("No resolver found for attribute: ${attribute.name}");

      return null;
    }
  }
}
