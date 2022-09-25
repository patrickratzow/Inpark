library tenants;

import 'package:dio/dio.dart';

class ApiClient {
  late final Dio _client;

  ApiClient({
    BaseOptions? options,
    void Function(Dio client)? configure,
  }) {
    options ??= BaseOptions(
      baseUrl: 'http://192.168.87.113:7071/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    _client = Dio(options);
    configure?.call(_client);
  }

  Future<List<Park>> getAllParks() async {
    var response = await _client.get('/get-all-parks');
    if (response.statusCode != 200) {
      return Future.error("Status code is not 200");
    }

    return response.data.map((x) => Park.fromJson(x)).cast<Park>().toList();
  }
}

class Park {
  final String name;
  final String imageUrl;
  final Address address;
  final GpsLocation location;

  Park({
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.location,
  });

  Park.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        imageUrl = json["imageUrl"],
        address = Address.fromJson(json["address"]),
        location = GpsLocation.fromJson(json["gpsLocation"]);
}

class Address {
  final String street;
  final int number;
  final String zipCode;
  final String city;

  Address({
    required this.street,
    required this.number,
    required this.zipCode,
    required this.city,
  });

  Address.fromJson(Map<String, dynamic> json)
      : street = json["street"],
        number = json["number"],
        zipCode = json["zipcode"],
        city = json["city"];
}

class GpsLocation {
  final int x;
  final int y;

  GpsLocation({
    required this.x,
    required this.y,
  });

  GpsLocation.fromJson(Map<String, dynamic> json)
      : x = json["x"],
        y = json["y"];
}
