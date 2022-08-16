import "package:flutter/material.dart";

class MapModel {
  final Offset topLeft;
  final Offset topRight;
  final Offset bottomLeft;
  final Offset bottomRight;
  final Map<Offset, Offset> gpsToMapOffsets;

  MapModel(
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.gpsToMapOffsets,
  );

  // Create a function that checks if a point is inside the map
  bool contains(Offset point) {
    // Check if the point is inside the rectangle
    return point.dx >= topLeft.dx &&
        point.dx <= topRight.dx &&
        point.dy >= topLeft.dy &&
        point.dy <= bottomLeft.dy;
  }

  // Create a function that converts a point to a percentage of the map
  Offset toPercentage(Offset point) {
    // Check if the point is inside the map
    if (!contains(point)) {
      throw Exception("Point is outside the map");
    }

    // Calculate the percentage of the map
    final x = (point.dx - topLeft.dx) / (topRight.dx - topLeft.dx);
    final y = (point.dy - topLeft.dy) / (bottomLeft.dy - topLeft.dy);

    return Offset(x, y);
  }

  // Find the closest map offset via a GPS coordinate
  Offset findClosestMapOffset(Offset gpsCoordinate) {
    // Find the closest map offset
    Offset closestMapOffset = gpsToMapOffsets.values.first;
    double closestDistance = double.infinity;

    for (final entry in gpsToMapOffsets.entries) {
      final key = entry.key;
      final value = entry.value;
      final gpsOffset = toPercentage(gpsCoordinate);
      final distance = (gpsOffset - value).distance;

      if (distance < closestDistance) {
        closestDistance = distance;
        closestMapOffset = value;
      }
    }

    return closestMapOffset;
  }

  // Calculate the distance between 2 Offset
  double distance(Offset a, Offset b) {
    return (a - b).distance;
  }
}
