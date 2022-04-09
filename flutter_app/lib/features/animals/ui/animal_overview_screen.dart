import 'package:flutter/material.dart';
import 'package:flutter_app/features/animals/bloc/animals_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'animal_card.dart';

class AnimalOverviewScreen extends StatelessWidget {
  const AnimalOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimalsBloc()..add(GetAnimals()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Animals"),
        ),
        body: BlocBuilder<AnimalsBloc, AnimalsState>(
          builder: (context, state) {
            if (state is AnimalsLoading) {
              return _loadingIndicator();
            }

            if (state is AnimalsError) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is AnimalsLoaded) {
              return ListView.builder(
                itemCount: state.animalsModel.animals.length,
                itemBuilder: (context, index) {
                  final animal = state.animalsModel.animals[index];

                  return AnimalCard(animal: animal);
                },
              );
            }

            return _loadingIndicator();
          },
        ),
      ),
    );
  }

  Widget _loadingIndicator() =>
      const Center(child: CircularProgressIndicator());
}
