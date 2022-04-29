import "package:flutter/cupertino.dart";
import "package:flutter_app/common/ioc.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";

import "../repositories/park_event_repository.dart";

class ParkEventModel extends ChangeNotifier {
  List<ParkEventDto> _parkEvents = List.empty();
  String _search = "";
  String error = "";
  bool isSearching = false;
  bool loading = false;
  bool get hasError => error.isNotEmpty;

  ParkEventModel();
  ParkEventModel.withParkEvents(this._parkEvents);

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

  Future<void> fetchParkEvents() async {
    final parkEventRepository = locator.get<ParkEventRepository>();

    try {
      loading = true;

      var animalsResult = await parkEventRepository.fetchParkEvents();
      if (animalsResult.isSuccess) {
        _parkEvents = animalsResult.success as List<ParkEventDto>;
      } else {
        error = animalsResult.error.toString();
      }
    } finally {
      loading = false;

      notifyListeners();
    }
  }

  List<ParkEventDto> get parkEvents {
    return _parkEvents;
  }
}
