import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_app/features/animals/ui/animal_category.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';

class AnimalCard extends StatelessWidget {
  const AnimalCard({
    Key? key,
    required this.animal,
  }) : super(key: key);

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 343 / 139,
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            buildImage(),
            buildShadow(),
            buildTextOverlay(),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Positioned.fill(
      child: Hero(
        tag: "animal-${animal.id}",
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: animal.image.previewUrl,
          colorBlendMode: BlendMode.darken,
          placeholder: (context, url) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildShadow() {
    return Positioned.fill(
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.53),
                    Colors.black.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextOverlay() {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    animal.name.displayName.trim(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    animal.name.latinName,
                    style: const TextStyle(
                      height: 1.5,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                AnimalCategory(
                  fontSize: 6,
                  text: animal.category,
                  padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
