import 'package:flutter_app/features/park_map/models/map_model.dart';
import "package:flutter_test/flutter_test.dart";

void main() {
  LocationToMapService service = LocationToMapService();

  test(
    "Generates unique hashes",
    () {
      // Arrange
      List<String> hashes = List<String>.generate(10000, (int i) {
        var x = (i / 10000) * 360 - 180;
        var y = (i / 10000) * 180 - 90;

        // Act
        return service.hashCoordinate(y, x);
      });

      // Check that hashes has no duplicates
      expect(hashes.length, hashes.toSet().length);
    },
  );
}
