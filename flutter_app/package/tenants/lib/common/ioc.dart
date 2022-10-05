import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import '../api_client.dart';
import '../repositories/park_repository.dart';

final locator = GetIt.instance;

void setupIoC() {
  String baseUrl;
  if (kDebugMode) {
    baseUrl =
        Platform.isAndroid ? "http://10.0.2.2:7071" : "https://localhost:5000";
  } else {
    baseUrl = "https://app-zoo-dev.azurewebsites.net";
  }

  locator.registerSingleton<ApiClient>(ApiClient());
  locator.registerLazySingleton<ParkRepository>(() => ParkRepository());
}
