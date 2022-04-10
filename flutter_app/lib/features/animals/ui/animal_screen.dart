import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/ui/fullscreen_image.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';

class AnimalScreen extends StatelessWidget {
  const AnimalScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Animal animal = ModalRoute.of(context)!.settings.arguments as Animal;

    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name.displayName),
      ),
      body: ListView(
        children: [
          Hero(
            tag: "animal-${animal.id}",
            child: GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl: animal.image.fullscreenUrl,
                      tag: "animal-${animal.id}",
                      title: animal.name.displayName,
                    ),
                  ),
                ),
              },
              child: CachedNetworkImage(
                imageUrl: animal.image.previewUrl,
              ),
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
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
                children: animal.contents
                    .skip(1)
                    .map((content) => Text(content.value))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
