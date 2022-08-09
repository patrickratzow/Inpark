import "package:flutter/material.dart";
import "package:flutter_app/common/screen.dart";
import "package:flutter_app/sdui/transformers/transformer.dart";

import "../features/animals/models/animal.dart";
import "../features/animals/models/iucn_status.dart";
import "../features/animals/ui/animal/animal_screen.dart";
import "../generated_code/zooinator.models.swagger.dart";
import "parser/parser.dart";

class ScreenWrapper extends StatelessWidget implements Screen {
  final Widget child;

  const ScreenWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class ScreenManager {
  Map<String, Screen Function(BuildContext context)> _screens = {};

  void registerScreen(String name, String input) {
    final parser = Parser();
    final element = parser.parse(input, "screen", ParserData());
    final builder = (BuildContext context) {
      return ScreenWrapper(child: Transformer.transformOne(element, context)!);
    };

    _screens[name.toLowerCase()] = builder;
  }

  Screen Function(BuildContext context)? getScreen(String name, dynamic data) {
    if (name == "animal_screen") {
      final animalDto = AnimalDto.fromJson(data);
      final animal = Animal(
        id: animalDto.id,
        displayName: animalDto.name.displayName,
        latinName: animalDto.name.latinName,
        category: animalDto.category,
        previewImageUrl: animalDto.image.previewUrl,
        fullscreenImageUrl: animalDto.image.fullscreenUrl,
        conservationStatus: ucnStatusColorMap[animalDto.status],
        description: "",
      );

      return (BuildContext context) {
        return AnimalScreen(animal: animal);
      };
    }

    return _screens[name.toLowerCase()];
  }
}
