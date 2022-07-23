import "dart:collection";
import "dart:math";

import "package:flutter/material.dart";

import "../../../common/ioc.dart";
import "../../../common/view_model.dart";
import "../repositories/park_map_repository.dart";
import "park_map_location.dart";

class ParkMapModel extends ViewModel {
  List<ParkMapLocation> _locations = List.empty();
  UnmodifiableListView<ParkMapLocation> get locations =>
      UnmodifiableListView(_locations);

  Map<Offset, Offset> _gpsToMapOffsets = {
    const Offset(272.7, 293.9):
        const Offset(57.0380730899578, 9.89877140773799),
    const Offset(273.5, 288.1):
        const Offset(57.038031872802364, 9.898691665188812),
    const Offset(273.4, 283.2):
        const Offset(57.03800801021778, 9.898635845404385),
    const Offset(271.7, 278.1):
        const Offset(57.03797026391633, 9.898556900280697),
    const Offset(270.5, 274.2):
        const Offset(57.03792991437926, 9.89848194228447),
    const Offset(268.9, 270.8):
        const Offset(57.037800622015645, 9.898371100134284),
    const Offset(267.0, 267.7):
        const Offset(57.03776894965748, 9.898309698371417),
    const Offset(264.6, 265.3):
        const Offset(57.037678271111695, 9.898309698371264),
    const Offset(261.6, 263.9):
        const Offset(57.03763792125749, 9.898320862328113),
  };

  Future fetchLocations() async {
    final repository = locator.get<ParkMapRepository>();

    try {
      loading = true;

      final result = await repository.fetchParkEvents();
      _locations = result;
    } catch (ex) {
      error = ex.toString();
    } finally {
      loading = false;

      notifyListeners();
    }
  }

  // Calculate the positional difference between two 2D Offset vectors
  double distanceTo(Offset a, Offset b) {
    final dx = a.dx - b.dx;
    final dy = a.dy - b.dy;

    return sqrt(dx * dx + dy * dy);
  }

  // Find the closest 2D Vector to another 2D Vector with the paramater name "gpsCoordinate"
  Offset closestGpsCoordinate(Offset gpsCoordinate) {
    var distance = double.infinity;
    Offset? closest;

    for (final entry in _gpsToMapOffsets.entries) {
      final currentDistance = distanceTo(gpsCoordinate, entry.value);
      print(
        "Current distance is $currentDistance, entry value is ${entry.value}, and gps coordinate is $gpsCoordinate",
      );

      if (currentDistance < distance) {
        distance = currentDistance;
        closest = entry.key;
      }
    }

    return closest!;
  }
}
