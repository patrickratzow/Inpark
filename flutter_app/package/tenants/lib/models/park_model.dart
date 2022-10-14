import 'package:flutter/material.dart';
import 'package:tenants/common/ioc.dart';
import 'package:tenants/models/park.dart';

import '../repositories/park_repository.dart';

class ParkModel extends ChangeNotifier {
  List<Park> _parks = List.empty();

  String _search = "";
  String error = "";
  bool isSearching = false;

  bool loading = true;
  bool get hasError => error.isNotEmpty;

  Future fetchParks() async {
    final parkRepository = locator.get<ParkRepository>();

    try {
      loading = true;

      _parks = await parkRepository.fetchParks();
    } catch (ex) {
      error = ex.toString();
    } finally {
      loading = false;

      notifyListeners();
    }
  }

  List<Park> get parks {
    return _parks;
  }

  String get search => _search;
  set search(String value) {
    _search = value;

    notifyListeners();
  }

  void startSearching() {
    _search = "";
    isSearching = true;

    notifyListeners();
  }

  void stopSearching() {
    _search = "";
    isSearching = false;

    notifyListeners();
  }

  List<TestPark> testParks() {
    List<TestPark> parks = [
      TestPark(
          name: "test1",
          imageUrl:
              "https://www.rd.com/wp-content/uploads/2021/04/GettyImages-845712410.jpg?resize=2048,1368",
          address: "some address",
          location: 1211),
      TestPark(
          name: "test2",
          imageUrl:
              "https://www.rd.com/wp-content/uploads/2021/04/GettyImages-845712410.jpg?resize=2048,1368",
          address: "some address",
          location: 1211),
      TestPark(
          name: "test3",
          imageUrl:
              "https://www.rd.com/wp-content/uploads/2021/04/GettyImages-845712410.jpg?resize=2048,1368",
          address: "some address",
          location: 1211),
      TestPark(
          name: "test4",
          imageUrl:
              "https://www.rd.com/wp-content/uploads/2021/04/GettyImages-845712410.jpg?resize=2048,1368",
          address: "some address",
          location: 1211)
    ];
    return parks;
  }
}

class TestPark {
  final String name;
  final String imageUrl;
  final String address;
  final int location;

  TestPark({
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.location,
  });
}
