import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationService {
  static final _instance = LocationService._internal();

  factory LocationService() => _instance;

  LocationService._internal();

  Stream<Position> streamPosition() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }

  Future<bool> serviceEnabled() async {
    var serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled.");
    }

    return serviceEnabled;
  }

  Future<bool> hasPermission() async {
    var permission = await Geolocator.checkPermission();
    return permission != LocationPermission.denied;
  }

  Future requestPermission() async {
    var permission = await Geolocator.requestPermission();
    switch (permission) {
      case LocationPermission.denied:
        return LocationPermission.denied;
      case LocationPermission.deniedForever:
        return LocationPermission.deniedForever.name;
      case LocationPermission.whileInUse:
        // TODO: Handle this case.
        break;
      case LocationPermission.always:
        // TODO: Handle this case.
        break;
      case LocationPermission.unableToDetermine:
        // TODO: Handle this case.
        break;
    }
  }
}



/**
 * var hasPermissions = await locationService.hasPermissions;
    if (!hasPermissions) {
      var result = locationService.requestPermissions();
      // handle if they said no idk?
    }

return await locationService.streamLocation();
 */