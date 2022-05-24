import "dart:collection";

import "../../../common/ioc.dart";
import "../../../common/view_model.dart";
import "../repositories/park_map_repository.dart";
import "park_map_location.dart";

class ParkMapModel extends ViewModel {
  List<ParkMapLocation> _locations = List.empty();
  UnmodifiableListView<ParkMapLocation> get locations =>
      UnmodifiableListView(_locations);

  Future fetchLocations() async {
    final repository = locator.get<ParkMapRepository>();

    try {
      loading = true;

      final result = await repository.fetchParkEvents();
      _locations = result;
    } catch (ex) {
      error = ex.toString();
    } finally {
      loading = false;

      notifyListeners();
    }
  }
}
