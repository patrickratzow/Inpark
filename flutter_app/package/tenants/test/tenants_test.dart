import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:tenants/api_client.dart';

void main() {
  late ApiClient apiClient;
  late DioAdapter dioAdapter;

  setUp(() {
    apiClient = ApiClient(configure: (dio) {
      dioAdapter = DioAdapter(dio: dio);
    });
  });

  test('gets all the parks from api', () async {
    // Arrange
    dioAdapter.onGet(
        "/get-all-parks",
        (server) => server.reply(
              200,
              [
                <String, dynamic>{
                  "name": "Aalborg Zoo",
                  "imageUrl": "",
                  "address": {
                    "street": "",
                    "number": 0,
                    "zipcode": "",
                    "city": ""
                  },
                  "gpsLocation": {
                    "x": 0,
                    "y": 0,
                  }
                }
              ],
            ));

    // Act
    var result = await apiClient.getAllParks();

    // Assert
    expect(result.length, 1);
  });

  test('getAllParks() should throw exception when 500 http status', () async {
    // Arrange
    dioAdapter.onGet(
      "get-all-parks",
      (server) => server.reply(500, {}),
    );

    // Act
    try {
      await apiClient.getAllParks();
      fail("Expected exception was not thrown");
    } catch (e) {
      // Assert
      expect(e, isA<Exception>());
    }
  });
}
