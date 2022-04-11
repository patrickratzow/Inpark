import 'package:flutter/material.dart';
import 'package:flutter_app/features/animals/bloc/animals_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'animal_card.dart';

class AnimalOverviewScreen extends StatefulWidget {
  const AnimalOverviewScreen({Key? key}) : super(key: key);

  @override
  State<AnimalOverviewScreen> createState() => _AnimalOverviewScreenState();
}

class _AnimalOverviewScreenState extends State<AnimalOverviewScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AnimalsBloc>(context).add(GetAnimals());
  }

  @override
  Widget build(BuildContext context) {
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
            return ListView(
              children: [
                buildSearch(context),
                ...state.animalsModel.animals.map(
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
            );
          }

          return _loadingIndicator();
        },
      ),
    );
  }

  Widget buildSearch(BuildContext context) {
    return BlocBuilder<AnimalsBloc, AnimalsState>(
      buildWhen: (previous, current) {
        return false;
      },
      builder: (context, state) {
        if (state is AnimalsLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: state.animalsModel.search,
              onChanged: (text) {
                BlocProvider.of<AnimalsBloc>(context).add(UpdateSearch(text));
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
          );
        }
        return Container();
      },
    );
  }

  Widget _loadingIndicator() =>
      const Center(child: CircularProgressIndicator());
}
