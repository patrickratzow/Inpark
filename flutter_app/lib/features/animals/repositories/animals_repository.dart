import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_app/features/animals/models/animal_area.dart";
import "../../../common/ioc.dart";
import "../../../common/result.dart";
import "../../../generated_code/zooinator.swagger.dart";

class AnimalsRepository {
  List<AnimalDto>? _animals;
  Map<String, List<AnimalArea>> _areas = {};

  Future<Result<List<AnimalDto>, String>> fetchAnimals() async {
    if (_animals != null) return Result.success(_animals);

    try {
      var apiClient = locator.get<Zooinator>();
      var response = await apiClient.getAnimals();

      if (!response.isSuccessful) {
        return Result.error(response.error.toString());
      }

      return Result.success(_animals ??= response.body);
    } catch (ex) {
      return Result.error(ex.toString());
    }
  }

  Future<List<AnimalArea>> getAnimalArea(
    String latinName,
  ) async {
    if (_areas.containsKey(latinName)) {
      return _areas[latinName]!;
    }

    try {
      var apiClient = locator.get<Zooinator>();
      var response = await apiClient.getAnimalAreas(latinName: latinName);

      if (!response.isSuccessful) {
        return Future.error(response.error.toString());
      }

      var areas = response.body!.map(
        (area) {
          var pointList = <Point>[];
          for (int i = 0; i < area.points.length; i += 2) {
            var x = area.points[i];
            var y = area.points[i + 1];

            var point = Point(x, y);
            pointList.add(point);
          }
          return AnimalArea(
            color: Color(int.parse("0xff" + area.color)),
            points: pointList,
          );
        },
      ).toList();

      _areas[latinName] = areas;
      return areas;
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }
}
