import "dart:io";

class CapabilityService {
  bool get shouldRequestPermissionsForNotifications => Platform.isIOS;
  bool get allowAppleLogin => Platform.isIOS;
}
