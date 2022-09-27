import 'package:flutter/material.dart';
import 'package:tenants/common/ioc.dart';
import 'package:tenants/models/park.dart';

import '../repositories/park_repository.dart';

class ParkModel extends ChangeNotifier {
  List<Park> _parks = List.empty();

  String _search = "";
  String error = "";
  bool isSearching = false;

  bool loading = false;
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
}
