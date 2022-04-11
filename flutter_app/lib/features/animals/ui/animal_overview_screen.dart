import 'package:flutter/material.dart';
import 'package:flutter_app/common/ui/screen_app_bar.dart';
import 'package:flutter_app/features/animals/models/animals_model.dart';
import 'package:provider/provider.dart';

import 'animal_card.dart';

class AnimalOverviewScreen extends StatelessWidget {
  const AnimalOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AnimalsModel>().fetchAnimals();

    return Scaffold(
      appBar: ScreenAppBar(
        name: "Dyr i parken",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black,
          )
        ],
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
    return Container();
  }

  Widget _loadingIndicator() =>
      const Center(child: CircularProgressIndicator());
}
