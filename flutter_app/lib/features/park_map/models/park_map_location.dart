import "package:flutter/widgets.dart";

@immutable
abstract class ParkMapLocation {
  final Offset _location;
  Offset get location => _location;
  final Size _size;
  Size get size => _size;

  Widget buildMapIcon(BuildContext context);
  Widget? buildActions(BuildContext context);

  ParkMapLocation({
    required Offset location,
    required Size size,
  })  : _location = location,
        _size = size;
}
