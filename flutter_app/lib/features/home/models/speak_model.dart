import "package:flutter/material.dart";
import "package:flutter_app/generated_code/zooinator.models.swagger.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";

import "../../../common/ioc.dart";
import "../repositories/home_repository.dart";

class SpeakModel extends ChangeNotifier {
  List<SpeakDto> _speaks = List.empty();
  String error = "";
  bool loading = false;

  List<SpeakDto> get topThreeSpeaks {
    //if there are no more talk for the day, then it should display
    var now = _getSeconds(DateTime.now());

    return _speaks
        .where((speak) => _getSeconds(speak.start) >= now)
        .take(3)
        .toList();
  }

  List<SpeakDto> get speaks => _speaks;

  Future<void> fetchSpeaksForToday() async {
    final homeRepository = locator.get<HomeRepository>();

    try {
      loading = true;

      var speaksResult = await homeRepository.fetchSpeaksForToday();
      if (speaksResult.isSuccess) {
        _speaks = speaksResult.success!;
      } else {
        error = speaksResult.error.toString();
      }
    } finally {
      loading = false;

      notifyListeners();
    }
  }

  int _getSeconds(DateTime dateTime) {
    var seconds = 0;
    seconds += dateTime.hour * (60 * 60);
    seconds += dateTime.minute * 60;
    seconds += dateTime.second;

    return seconds;
  }
}
