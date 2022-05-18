import "dart:collection";

import "package:flutter/material.dart";
import "../../../extensions/datetime.dart";
import "notification_service.dart";
import "speak.dart";
import "package:localstorage/localstorage.dart";

import "../../../common/ioc.dart";
import "../repositories/speak_repository.dart";

class SpeakModel extends ChangeNotifier {
  List<Speak> _speaks = List.empty();
  UnmodifiableListView<Speak> get speaks => UnmodifiableListView(_speaks);
  String error = "";
  bool loading = false;

  final LocalStorage _localStorage = LocalStorage("speaks.json");
  final NotificationService _notificationService = NotificationService();

  Future<void> fetchSpeaksForToday() async {
    final homeRepository = locator.get<SpeakRepository>();

    try {
      loading = true;

      var speaksResult = await homeRepository.fetchSpeaksForToday();
      _speaks = speaksResult;
      _speaks = [
        Speak(
          "Test",
          DateTime.now().add(Duration(minutes: 16, seconds: 5)),
          _speaks.first.image,
          _speaks.first.days,
        ),
        ..._speaks,
      ];
    } catch (ex) {
      error = ex.toString();
    } finally {
      loading = false;

      notifyListeners();
    }
  }

  Future<bool> toggleNotification(Speak speak) async {
    var isToggled = await this.isToggled(speak);

    if (isToggled) {
      cancelNotification(speak);
      await cacheState(speak, false);

      return false;
    }

    var scheduleNotification = await this.scheduleNotification(speak);
    if (!scheduleNotification) {
      return Future.error("no_permission");
    }

    await cacheState(speak, true);

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

  Future cacheState(Speak speak, bool state) async {
    await _initStorage();

    if (state) {
      await _localStorage.setItem(todaysId(speak), state.toString());

      return;
    }

    await _localStorage.deleteItem(todaysId(speak));
  }

  String todaysId(Speak speak) {
    return "${speak.id}_${DateTime.now().day}";
  }

  Future<bool> isToggled(Speak speak) async {
    await _initStorage();

    if (speak.hasBegun) return false;

    var item = _localStorage.getItem(todaysId(speak));

    return item != null;
  }

  Future _initStorage() async {
    return await _localStorage.ready;
  }
}
