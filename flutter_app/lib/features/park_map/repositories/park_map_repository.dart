import "package:flutter/widgets.dart";

import "../../../common/ioc.dart";
import "../../animals/repositories/animals_repository.dart";
import "../models/animal_park_map_location.dart";
import "../models/park_map_location.dart";

class ParkMapRepository {
  List<ParkMapLocation>? _locations;

  Future<List<ParkMapLocation>> fetchParkEvents() async {
    final animals = await locator.get<AnimalsRepository>().fetchAnimals();

    return _locations ??= [
      AnimalParkMapLocation(
        animal: animals.first,
        location: const Offset(70, 35),
        size: const Size(12, 12),
      ),
    ];
  }
}
