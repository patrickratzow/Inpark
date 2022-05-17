import "dart:io";

import "package:flutter/material.dart";

class PolicyService {
  bool get centerAppBarTitle => Platform.isIOS;
  bool get showCancelButtonAsText => Platform.isIOS;
  IconData get appBarBackButton =>
      Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back;
}
