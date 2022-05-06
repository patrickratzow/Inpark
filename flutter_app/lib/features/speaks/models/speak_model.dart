import 'dart:convert';
import 'dart:typed_data';

import "package:flutter/material.dart";
import 'package:flutter_app/features/speaks/models/notification_service.dart';
import 'package:flutter_app/features/speaks/models/speak.dart';
import "package:flutter_app/generated_code/zooinator.models.swagger.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:localstorage/localstorage.dart';

import '../../../common/ioc.dart';
import '../repositories/speak_repository.dart';

class SpeakModel extends ChangeNotifier {
  List<Speak> _speaks = List.empty();
  String error = "";
  bool loading = false;
  List<Speak> get speaks => _speaks;

  LocalStorage _localStorage = LocalStorage("speaks.json");
  NotificationService _notificationService = NotificationService();

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

  bool toggleNotification(Speak speak) {
    var isToggled = this.isToggled(speak);

    if (isToggled) {
      cancelNotification(speak);
      cacheState(speak, false);

      return false;
    }

    scheduleNotification(speak);
    cacheState(speak, true);

    return true;
  }

  void scheduleNotification(Speak speak) {
    var seconds = secondsToNotification(speak.start);

    _notificationService.showNotification(
      speak.id,
      "${speak.title} fodring",
      "${speak.title} bliver fodret om 15 minutter",
      seconds,
    );
  }

  void cancelNotification(Speak speak) {
    _notificationService.cancelNotifications(speak.id);
  }

  int secondsToNotification(DateTime time) {
    var now = DateTime.now();
    var normalizedTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
      time.second,
    );

    return normalizedTime
        .subtract(
          const Duration(minutes: 15),
        )
        .difference(now)
        .inSeconds;
  }

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
