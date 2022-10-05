import 'package:tenants/api_client.dart';
import '../common/ioc.dart';
import '../models/park.dart';

class ParkRepository {
  List<Park>? _parks;

  Future<List<Park>> fetchParks() async {
    if (_parks != null) return _parks!;

    try {
      var apiClient = locator.get<ApiClient>();
      var response = await apiClient.getAllParks();

      _parks = response;

      return _parks!;
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }
}
