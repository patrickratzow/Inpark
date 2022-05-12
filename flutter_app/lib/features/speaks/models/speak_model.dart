import "package:flutter/material.dart";
import "package:flutter_app/extensions/datetime.dart";
import "package:flutter_app/features/speaks/models/notification_service.dart";
import "package:flutter_app/features/speaks/models/speak.dart";
import "package:localstorage/localstorage.dart";

import "../../../common/ioc.dart";
import "../repositories/speak_repository.dart";

class SpeakModel extends ChangeNotifier {
  List<Speak> _speaks = List.empty();
  String error = "";
  bool loading = false;
  List<Speak> get speaks => [
        Speak(
          "test",
          DateTime.now().add(const Duration(minutes: 25)),
          _speaks.first.image,
          _speaks.first.days,
        ),
        ..._speaks
      ];

  final LocalStorage _localStorage = LocalStorage("speaks.json");
  final NotificationService _notificationService = NotificationService();

  Future<void> fetchSpeaksForToday() async {
    final homeRepository = locator.get<SpeakRepository>();

    try {
      loading = true;

      var speaksResult = await homeRepository.fetchSpeaksForToday();
      _speaks = speaksResult;
    } catch (ex) {
      error = ex.toString();
    } finally {
      loading = false;

      notifyListeners();
    }
  }

  Future<bool> toggleNotification(Speak speak) async {
    var isToggled = this.isToggled(speak);

    if (isToggled) {
      cancelNotification(speak);
      cacheState(speak, false);

      return false;
    }

    var scheduleNotification = await this.scheduleNotification(speak);
    if (!scheduleNotification) {
      return Future.error("no_permission");
    }

    cacheState(speak, true);

    return true;
  }

  Future<bool> scheduleNotification(Speak speak) {
    var seconds = secondsToNotification(speak.start);

    return _notificationService.showNotification(
      speak.id,
      "${speak.title} fodring",
      "${speak.title} bliver fodret om 15 minutter",
      seconds,
    );
  }

  void cancelNotification(Speak speak) {
    _notificationService.cancelNotifications(speak.id);
  }

  int secondsToNotification(DateTime time) => time
      .asToday()
      .subtract(
        const Duration(minutes: 15),
      )
      .difference(DateTime.now())
      .inSeconds;

  void cacheState(Speak speak, bool state) {
    var id = speak.id;

    if (state) {
      _localStorage.setItem(id.toString(), state.toString());

      return;
    }

    _localStorage.deleteItem(id.toString());
  }

  bool isToggled(Speak speak) {
    if (speak.hasBegun()) return false;

    var id = speak.id.toString();
    var item = _localStorage.getItem(id);

    return item != null;
  }
}
