import 'package:flutter/material.dart';
import 'package:flutter_app/common/ui/screen_app_bar.dart';
import 'package:flutter_app/features/animals/models/animals_model.dart';
import 'package:flutter_app/features/animals/ui/search_bar.dart';
import 'package:provider/provider.dart';

import 'animal_card.dart';

class AnimalOverviewScreen extends StatefulWidget {
  const AnimalOverviewScreen({Key? key}) : super(key: key);

  @override
  State<AnimalOverviewScreen> createState() => _AnimalOverviewScreenState();
}

class _AnimalOverviewScreenState extends State<AnimalOverviewScreen> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('');
  String name = '';

  @override
  Widget build(BuildContext context) {
    context.read<AnimalsModel>().fetchAnimals();
    return Scaffold(
      appBar: SearchBar(
        name: customSearchBar,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = ListTile(
                    leading: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 28,
                    ),
                    title: TextFormField(
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
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                } else {
                  name = '';
                  customIcon = const Icon(Icons.search);
                  customSearchBar = Text(name);
                }
              });
            },
            icon: customIcon,
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
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _loadingIndicator() =>
      const Center(child: CircularProgressIndicator());
}
