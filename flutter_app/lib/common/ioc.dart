import 'dart:io';

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_app/features/animals/ioc.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupIoC() {
  String baseUrl;
  if (kDebugMode) {
    baseUrl =
        Platform.isAndroid ? "https://10.0.2.2:5000" : "https://localhost:5000";
  } else {
    baseUrl = 'https://app-zoo-dev.azurewebsites.net';
  }
  locator.registerSingleton<Zooinator>(Zooinator.create(baseUrl: baseUrl));

  setupAnimalsIoC(locator);
}
