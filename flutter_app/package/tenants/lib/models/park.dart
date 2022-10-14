import 'package:tenants/models/address.dart';
import 'gps_location.dart';

class Park {
  final String id;
  final String name;
  final String imageUrl;
  final Address address;
  final GpsLocation location;

  Park({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.location,
  });

  Park.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        imageUrl = json["imageUrl"],
        address = Address.fromJson(json["address"]),
        location = GpsLocation.fromJson(json["gpsLocation"]);
}
