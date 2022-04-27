import "package:flutter/material.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import "package:flutter_app/features/animals/models/animals_model.dart";
import "package:flutter_app/features/animals/ui/search_bar.dart";
import 'package:flutter_app/features/calendar/calendar_screen.dart';
import 'package:flutter_app/routes.dart';
import "package:provider/provider.dart";

import "animal_card.dart";

class AnimalOverviewScreen extends StatelessWidget {
  const AnimalOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: false,
            automaticallyImplyLeading: false,
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
                title: "Vores Dyr",
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

    return Consumer<AnimalsModel>(
      builder: (context, animalsModel, child) {
        if (animalsModel.loading) {
          return SliverFillRemaining(
            child: _loadingIndicator(),
          );
        }

        if (animalsModel.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text("An error happened: " + animalsModel.error),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index >= animalsModel.animals.length) {
                return null;
              }

              final animal = animalsModel.animals[index];
              final double topPadding = index == 0 ? 16 : 0;
              return Padding(
                padding: EdgeInsets.fromLTRB(16, topPadding, 16, 0),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    Routes.goToAnimalScreen(context, animal);
                  },
                  child: AnimalCard(animal: animal),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _loadingIndicator() =>
      const Center(child: CircularProgressIndicator());
}
