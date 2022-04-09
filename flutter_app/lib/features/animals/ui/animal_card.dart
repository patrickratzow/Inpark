import 'package:cached_network_image/cached_network_image.dart';
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
            child: CachedNetworkImage(
              imageUrl: animal.image.previewUrl,
              placeholder: (context, url) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          ListTile(
            title: Text(
              animal.name.displayName.trim(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 59, 91, 59),
              ),
            ),
            subtitle: Text(
              animal.name.latinName,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 59, 91, 59),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
