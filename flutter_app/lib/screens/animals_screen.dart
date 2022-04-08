import 'package:flutter/material.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';
import 'package:flutter_app/logic/models/animals.dart';
import 'package:provider/provider.dart';

class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AnimalsModel>().fetchAnimals;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Animals"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<AnimalsModel>().fetchAnimals;
        },
        child: Consumer<AnimalsModel>(
          builder: (context, value, child) {
            if (value.hasError) {
              return Center(
                child: Text(value.errorMessage),
              );
            } else if (value.animals.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: value.animals.length,
              itemBuilder: (context, index) {
                var animal = value.animals[index];

                return AnimalCard(animal: animal);
              },
            );
          },
        ),
      ),
    );
  }
}

class AnimalCard extends StatelessWidget {
  const AnimalCard({
    Key? key,
    required this.animal,
  }) : super(key: key);

  final ZooInparkContractsAnimal animal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          animal.image!.previewUrl!,
        ),
        ListTile(
          title: Text(
            animal.name!.displayName!.trim(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(animal.name!.latinName!),
        ),
      ],
    );
  }
}
