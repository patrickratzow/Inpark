import "dart:io";

import "package:flutter/material.dart";

class PolicyService {
  bool get centerAppBarTitle => Platform.isIOS;
  bool get showCancelButtonAsText => Platform.isIOS;
  IconData get appBarBackButton => Icons.adaptive.arrow_back;
}
