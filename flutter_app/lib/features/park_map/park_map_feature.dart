import "package:flutter/cupertino.dart";

import "../../common/feature.dart";

class ParkMapFeature extends Feature {
  @override
  String get featureId => "park_map";

  @override
  bool get isEnabled => true;

  @override
  FrontPageWidget? get frontPageMaterial => null;

  @override
  Future setup(BuildContext context) async {
    return;
  }
}
