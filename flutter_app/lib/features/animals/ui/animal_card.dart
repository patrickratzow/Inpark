import 'package:flutter/material.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';

class AnimalCard extends StatelessWidget {
  const AnimalCard({
    Key? key,
    required this.animal,
  }) : super(key: key);

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Hero(
            tag: "animal-${animal.id}",
            child: Image.network(
              animal.image.previewUrl,
            ),
          ),
          ListTile(
            title: Text(
              animal.name.displayName.trim(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(animal.name.latinName),
          ),
        ],
      ),
    );
  }
}
