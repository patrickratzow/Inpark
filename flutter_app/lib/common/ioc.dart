import "dart:io";

import "package:flutter/foundation.dart";
import "package:flutter_app/sdui/screen.dart";
import "package:flutter_app/sdui/transformers/button.dart";
import "package:get_it/get_it.dart";

import "../features/animals/ioc.dart";
import "../features/calendar/repository/calendar_repository.dart";
import "../features/home/repositories/home_repository.dart";
import "../features/park_events/repositories/park_event_repository.dart";
import "../features/park_map/repositories/park_map_repository.dart";
import "../features/speaks/repositories/speak_repository.dart";
import "../generated_code/zooinator.swagger.dart";
import "../services/capability_service.dart";
import "../services/notification_service.dart";
import "../services/policy_service.dart";

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

  // SDUI
  locator.registerLazySingleton<ActionService>(() => ActionService());
  locator.registerLazySingleton<ScreenManager>(() => ScreenManager());

  setupAnimalsIoC(locator);

  locator.registerLazySingleton<HomeRepository>(() => HomeRepository());
  locator
      .registerLazySingleton<ParkEventRepository>(() => ParkEventRepository());
  locator.registerLazySingleton<SpeakRepository>(() => SpeakRepository());
  locator.registerLazySingleton<CalendarRepository>(() => CalendarRepository());
  locator.registerLazySingleton<PolicyService>(() => PolicyService());
  locator.registerLazySingleton<CapabilityService>(() => CapabilityService());
  locator.registerLazySingleton<ParkMapRepository>(() => ParkMapRepository());
  locator
      .registerLazySingleton<NotificationService>(() => NotificationService());
}
