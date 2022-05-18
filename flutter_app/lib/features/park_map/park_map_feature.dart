import "package:flutter/cupertino.dart";

import "../../common/feature.dart";

class ParkMapFeature extends Feature {
  @override
  String get featureId => "speaks";

  @override
  bool get isEnabled => true;

  @override
  FrontPageWidget? get frontPageMaterial => null;

  @override
  Future setup(BuildContext context) async {
    return;
  }
}
