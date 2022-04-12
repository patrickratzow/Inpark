import "package:flutter/material.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import "package:flutter_app/features/animals/models/animals_model.dart";
import "package:flutter_app/features/animals/ui/search_bar.dart";
import "package:provider/provider.dart";

import "animal_card.dart";

class AnimalOverviewScreen extends StatelessWidget {
  AnimalOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalsModel>(
      builder: (context, animalsModel, child) {
        return Scaffold(
          appBar: (animalsModel.isSearching
              ? SearchBar(
                  onCancel: animalsModel.stopSearching,
                  onChanged: (text) {
                    animalsModel.search = text;
                  },
                )
              : ScreenAppBar(
                  actions: [buildSearchIcon(context)],
                ) as PreferredSizeWidget),
          body: const AnimalsOverviewList(),
        );
      },
    );
  }

  IconButton buildSearchIcon(BuildContext context) {
    Icon customIcon = const Icon(Icons.search);
    Widget customSearchBar = const Text("");

    return IconButton(
      onPressed: () {
        context.read<AnimalsModel>().startSearching();
      },
      icon: customIcon,
      color: Colors.black,
    );
  }
}

class AnimalsOverviewList extends StatelessWidget {
  const AnimalsOverviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AnimalsModel>().fetchAnimals();

    return Consumer<AnimalsModel>(
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
    );
  }

  Widget _loadingIndicator() =>
      const Center(child: CircularProgressIndicator());
}
