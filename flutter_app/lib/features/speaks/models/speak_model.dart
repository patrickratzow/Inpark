import "dart:collection";

import "package:flutter/material.dart";
import "../../../extensions/datetime.dart";
import "../../../services/notification_service.dart";
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
  final NotificationModel _notificationService = NotificationModel();

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

  Future<bool> toggleNotification(Speak speak, Duration timeBefore) async {
    var isToggled = await this.isToggled(speak);

    if (isToggled) {
      cancelNotification(speak);
      await cacheState(speak, false);

      return false;
    }

    var scheduleNotification =
        await this.scheduleNotification(speak, timeBefore);
    if (!scheduleNotification) {
      return Future.error("no_permission");
    }

    await cacheState(speak, true);

    return true;
  }

  Future<bool> scheduleNotification(Speak speak, Duration? timeBefore) async {
    final duration = timeBefore ??
        Duration(
          seconds: await secondsToNotification(speak.start),
        );

    return _notificationService.showNotification(
      speak.id,
      "${speak.title} fodring",
      "${speak.title} Speak starter om ${duration.inMinutes} minutter",
      duration.inSeconds,
    );
  }

  void cancelNotification(Speak speak) {
    _notificationService.cancelNotifications(speak.id);
  }

  Future<int> secondsToNotification(DateTime time) async {
    final notificationService = locator.get<NotificationService>();
    final duration = await notificationService.getReminderTime();

    return time
        .asToday()
        .subtract(duration)
        .difference(DateTime.now())
        .inSeconds;
  }

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
