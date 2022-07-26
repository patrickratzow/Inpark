import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../../../common/extensions/theme.dart";
import "../../../../generated_code/zooinator.swagger.dart";
import "../../../../hooks/hooks.dart";
import "animal_category.dart";

class AnimalCard extends HookWidget {
  final AnimalDto animal;

  const AnimalCard({
    super.key,
    required this.animal,
  });

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return AspectRatio(
      aspectRatio: 343 / 139,
      child: Card(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            buildImage(),
            buildShadow(),
            buildTextOverlay(theme),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Positioned.fill(
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

  Widget buildTextOverlay(ThemeData theme) {
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
                    animal.name.displayName,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.adjustColor(
                        light: Colors.white,
                        dark: Colors.black,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    animal.name.latinName,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: theme.adjustColor(
                        light: Colors.white,
                        dark: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                AnimalCategory(
                  fontSize: 8,
                  text: animal.category,
                  padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
