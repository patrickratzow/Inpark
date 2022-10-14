import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tenants/services/location_service.dart';

class LocationModel extends ChangeNotifier {
  LocationPermission permission = LocationPermission.unableToDetermine;
  Position? currentPosition;
  late StreamSubscription<Position> positionStream;

  bool loading = false;

  Future<Position> getLocation(LocationService locationService) async {
    try {
      loading = true;
      notifyListeners();
      var getPosition = await locationService.determinePosition();

      return currentPosition = getPosition;
    } finally {
      loading = false;
      notifyListeners();
    }
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
