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
