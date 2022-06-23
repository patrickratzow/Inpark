import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zooinator_content_rendering/resolvers/axis_direction.dart';
import 'package:zooinator_content_rendering/resolvers/cross_axis_alignment.dart';
import 'package:zooinator_content_rendering/resolvers/icon_data.dart';
import 'package:zooinator_content_rendering/resolvers/main_axis_alignment.dart';
import 'package:zooinator_content_rendering/resolvers/text_align.dart';
import 'package:zooinator_content_rendering/resolvers/text_baseline.dart';
import 'package:zooinator_content_rendering/resolvers/text_direction.dart';
import 'package:zooinator_content_rendering/resolvers/vertical_direction.dart';

import '../elements/attribute.dart';
import 'alignment.dart';
import 'main_axis_size.dart';

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
  };

  bool shouldResolve(Attribute attribute);
  T? resolve(Attribute attribute, BuildContext context);

  static dynamic resolveAttribute<T>(
      Attribute attribute, BuildContext context) {
    try {
      return resolvers
          .firstWhere((resolver) => resolver.shouldResolve(attribute))
          .resolve(attribute, context);
    } catch (ex) {
      log('No resolver found for attribute: ${attribute.name}');

      return null;
    }
  }
}
