import 'dart:io';

import 'package:flutter_app/generated_code/zooinator.swagger.dart';

class ApiClient {
  ApiClient._privateConstructor();

  static final Zooinator instance = Zooinator.create(
      baseUrl: Platform.isAndroid
          ? "https://10.0.2.2:5000"
          : "https://localhost:5000");
}
