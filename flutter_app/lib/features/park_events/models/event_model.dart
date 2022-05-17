import "package:flutter/cupertino.dart";
import "../../../common/ioc.dart";
import "../../../generated_code/zooinator.swagger.dart";

import '../repositories/park_event_repository.dart';

class ParkEventModel extends ChangeNotifier {
  List<ParkEventDto> _parkEvents = List.empty();
  String error = "";
  bool loading = false;
  bool get hasError => error.isNotEmpty;

  ParkEventModel();

  Future<void> fetchParkEvents() async {
    final parkEventRepository = locator.get<ParkEventRepository>();

    try {
      loading = true;

      var parkEventResult = await parkEventRepository.fetchParkEvents();
      if (parkEventResult.isSuccess) {
        _parkEvents = parkEventResult.success as List<ParkEventDto>;
      } else {
        error = parkEventResult.error.toString();
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
