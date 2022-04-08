import 'package:flutter/foundation.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';
import 'package:flutter_app/logic/api_client.dart';

class AnimalsModel extends ChangeNotifier {
  late ZooInparkContractsAnimalOverview _overview =
      ZooInparkContractsAnimalOverview();
  bool hasError = false;
  String errorMessage = "";

  Future<void> get fetchAnimals async {
    var response = await ApiClient.instance.animalsOverviewGet();
    if (response.isSuccessful) {
      _overview = response.body!;
      _overview.animals!
          .sort((a, b) => a.name!.displayName!.compareTo(b.name!.displayName!));
    } else {
      hasError = true;
      errorMessage = response.error.toString();
    }

    notifyListeners();
  }

  List<ZooInparkContractsAnimal> get animals =>
      _overview.animals == null ? List.empty() : _overview.animals!;
}
