import 'package:flutter/material.dart';
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
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: animal.contents
                  .skip(1)
                  .map(
                    (content) => Text(content.text),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
