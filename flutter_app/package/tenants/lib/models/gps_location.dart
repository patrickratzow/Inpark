class GpsLocation {
  final double x;
  final double y;

  GpsLocation({
    required this.x,
    required this.y,
  });

  GpsLocation.fromJson(Map<String, dynamic> json)
      : x = json["x"],
        y = json["y"];
}
