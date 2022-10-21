import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tenants/services/location_service.dart';

class LocationModel extends ChangeNotifier {
  LocationPermission permission = LocationPermission.unableToDetermine;
  Position? currentPosition;

  bool loading = false;

  Future subscribeToLocation() async {
    var locationService = LocationService();

    try {
      loading = true;

      var positionStream = await listenToLocation(locationService);

      if (positionStream is Stream<Position>) {
        positionStream.listen((Position position) {
          print("Position is $position");
          currentPosition = position;
          notifyListeners();
        });
      }
    } catch (error) {
      print("stream error: $error");
      return error;
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<dynamic> listenToLocation(LocationService locationService) async {
    var hasPermission = await locationService.hasPermission();
    if (!hasPermission) {
      var result = await locationService.requestPermission();
      print("Permission: " + result);
      return result;
    }

    return locationService.streamPosition();
  }

  String calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    var result = 12742 * asin(sqrt(a));
    print(result);
    return result.toStringAsFixed(2);
  }
}
