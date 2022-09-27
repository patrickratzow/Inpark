library tenants;

import 'package:dio/dio.dart';

import 'models/park.dart';

class ApiClient {
  late final Dio _client;

  ApiClient({
    BaseOptions? options,
    void Function(Dio client)? configure,
  }) {
    options ??= BaseOptions(
      baseUrl: 'http://10.0.2.2:7071/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    _client = Dio(options);
    configure?.call(_client);
  }

  Future<List<Park>> getAllParks() async {
    var response = await _client.get('/get-all-parks');
    if (response.statusCode != 200) {
      return Future.error("Status code is not 200");
    }

    return response.data.map((x) => Park.fromJson(x)).cast<Park>().toList();
  }
}
