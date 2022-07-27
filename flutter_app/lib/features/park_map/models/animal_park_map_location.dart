import "package:flutter/material.dart";

import "../../../generated_code/zooinator.models.swagger.dart";
import "../../../hooks/hooks.dart";
import "../../animals/ui/animal/animal_card.dart";
import "../../animals/ui/animal/animal_screen.dart";
import "park_map_location.dart";

@immutable
class AnimalParkMapLocation extends ParkMapLocation {
  final AnimalDto animal;

  AnimalParkMapLocation({
    required this.animal,
    required super.location,
    required super.size,
  });

  @override
  Widget? buildActions(BuildContext context) {
    final navigator = useNavigator();

    return GestureDetector(
      onTap: () => navigator.push(
        context,
        AnimalScreen(animal: animal),
        hide: true,
      ),
      child: AnimalCard(
        key: ValueKey(animal.id),
        animal: animal,
      ),
    );
  }

  @override
  Widget buildMapIcon(BuildContext context) {
    return Icon(
      Icons.pets,
      color: Colors.white,
      size: size.width,
    );
  }
}
