import 'dart:io';

import 'package:flutter_app/features/animals/ioc.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupIoC() {
  locator.registerSingleton<Zooinator>(
    Zooinator.create(
      baseUrl: Platform.isAndroid
          ? "https://10.0.2.2:5000"
          : "https://localhost:5000",
    ),
  );

  setupAnimalsIoC(locator);
}
