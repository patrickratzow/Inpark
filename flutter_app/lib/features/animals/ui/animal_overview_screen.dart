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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: false,
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            floating: true,
            flexibleSpace: _buildAppBar(),
          ),
          const AnimalsOverviewList()
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Consumer<AnimalsModel>(
      builder: (context, animalsModel, child) {
        final widget = animalsModel.isSearching
            ? SearchBar(
                onCancel: animalsModel.stopSearching,
                onChanged: (text) {
                  animalsModel.search = text;
                },
              )
            : ScreenAppBar(
                actions: [buildSearchIcon(context)],
              );

        return widget;
      },
    );
  }

  Widget buildSearchIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<AnimalsModel>().startSearching();
      },
      icon: const Icon(Icons.search),
      color: Colors.black,
    );
  }
}

class AnimalsOverviewList extends StatelessWidget {
  const AnimalsOverviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AnimalsModel>().fetchAnimals();

    return Consumer<AnimalsModel>(builder: (context, animalsModel, child) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (animalsModel.loading) {
              return _loadingIndicator();
            }

            if (animalsModel.hasError) {
              return Center(
                child: Text("An error happened: " + animalsModel.error),
              );
            }

            if (index >= animalsModel.animals.length) {
              return null;
            }

            final animal = animalsModel.animals[index];
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: TextButton(
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
            );
          },
        ),
      );
    });
  }

  Widget _loadingIndicator() =>
      const Center(child: CircularProgressIndicator());
}
