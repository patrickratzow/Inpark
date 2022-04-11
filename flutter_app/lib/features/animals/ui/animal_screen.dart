import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/ui/bullet_list.dart';
import 'package:flutter_app/common/ui/fullscreen_image.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';

class AnimalScreen extends StatelessWidget {
  const AnimalScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Animal animal = ModalRoute.of(context)!.settings.arguments as Animal;

    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name.displayName),
      ),
      body: ListView(
        children: [
          Hero(
            tag: "animal-${animal.id}",
            child: GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl: animal.image.fullscreenUrl,
                      tag: "animal-${animal.id}",
                      title: animal.name.displayName,
                    ),
                  ),
                ),
              },
              child: CachedNetworkImage(
                imageUrl: animal.image.previewUrl,
              ),
            ),
          ),
          ListTile(
            title: Text(
              animal.name.displayName.trim(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 59, 91, 59),
              ),
            ),
            subtitle: Text(
              animal.name.latinName,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 59, 91, 59),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: _buildContents(animal.contents),
          ),
        ],
      ),
    );
  }

  Widget _buildContents(List<ContentDto> contents) {
    return Column(
      children: contents.map(_buildContent).toList(),
    );
  }

  Widget _buildContent(ContentDto content) {
    if (content.type == "container") {
      return Column(
        children: content.children.map(_buildContent).toList(),
      );
    }
    if (content.type == "text") {
      return Text(
        content.value.toString(),
        textAlign: TextAlign.left,
        softWrap: true,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black.withOpacity(0.6),
          height: 1.55,
        ),
      );
    }
    if (content.type == "spacer") {
      return const SizedBox(height: 8);
    }
    if (content.type == "list") {
      var children =
          content.children.where((child) => child.type == "listitem");

      return BulletList(children.map(_buildContent).toList());
    }
    if (content.type == "listitem") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content.children.map(_buildContent).toList(),
      );
    }
    if (content.type == "image") {
      return CachedNetworkImage(
        imageUrl: content.value.toString(),
      );
    }

    return Container();
  }
}
