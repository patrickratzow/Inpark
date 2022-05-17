import "dart:io";

import "package:flutter/foundation.dart" show kDebugMode;
import "package:flutter_app/features/animals/ioc.dart";
import "package:flutter_app/features/calendar/repository/calendar_repository.dart";
import "package:flutter_app/features/home/repositories/home_repository.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";
import "package:flutter_app/services/capability_service.dart";
import "../features/animals/ioc.dart";
import "../features/calendar/repository/calendar_repository.dart";
import "../features/home/repositories/home_repository.dart";
import "../services/policy_service.dart";
import "package:get_it/get_it.dart";

import "../features/park_events/repositories/park_event_repository.dart";
import "../features/speaks/repositories/speak_repository.dart";

final locator = GetIt.instance;

void setupIoC() {
  String baseUrl;
  if (kDebugMode) {
    baseUrl =
        Platform.isAndroid ? "https://10.0.2.2:5000" : "https://localhost:5000";
  } else {
    baseUrl = "https://app-zoo-dev.azurewebsites.net";
  }
  locator.registerSingleton<Zooinator>(Zooinator.create(baseUrl: baseUrl));

  setupAnimalsIoC(locator);

  locator.registerLazySingleton<HomeRepository>(() => HomeRepository());
  locator
      .registerLazySingleton<ParkEventRepository>(() => ParkEventRepository());
  locator.registerLazySingleton<SpeakRepository>(() => SpeakRepository());
  locator.registerLazySingleton<CalendarRepository>(() => CalendarRepository());
  locator.registerLazySingleton<PolicyService>(() => PolicyService());
  locator.registerLazySingleton<CapabilityService>(() => CapabilityService());
}
