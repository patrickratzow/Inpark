import 'package:flutter/material.dart';
import 'package:flutter_app/features/animals/models/animals_model.dart';
import 'package:provider/provider.dart';

import 'animal_card.dart';

class AnimalOverviewScreen extends StatelessWidget {
  const AnimalOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AnimalsModel>().fetchAnimals();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
        title: const Text("Dyr i parken"),
      ),
      body: Consumer<AnimalsModel>(
        builder: (context, animalsModel, child) {
          if (animalsModel.loading) {
            return _loadingIndicator();
          }

          if (animalsModel.hasError) {
            return Center(
              child: Text("An error happened: " + animalsModel.error),
            );
          }

          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: ListView(
              children: [
                buildSearch(context),
                ...animalsModel.animals.map(
                  (animal) => TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/animals/id",
                        arguments: animal,
                      );
                    },
                    child: AnimalCard(animal: animal),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildSearch(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: "",
          onChanged: (text) {
            context.read<AnimalsModel>().search = text;
          },
          decoration: const InputDecoration(
            hintText: 'Søg efter dyr',
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _loadingIndicator() =>
      const Center(child: CircularProgressIndicator());
}
