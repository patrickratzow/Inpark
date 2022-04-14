import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_app/common/ui/bullet_list.dart";
import "package:flutter_app/common/ui/fullscreen_image.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import 'package:flutter_app/features/animals/models/iucn_status.dart';
import "package:flutter_app/features/animals/ui/animal_category.dart";
import "package:flutter_app/features/animals/ui/conservation_status.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";

import "../../../common/colors.dart";

class AnimalScreen extends StatelessWidget {
  final Animal animal;
  const AnimalScreen({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: false,
            snap: false,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            floating: true,
            flexibleSpace: ScreenAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index != 0) return null;

                return _buildCard(context, animal);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, Animal animal) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          GestureDetector(
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
            child: _buildImage(animal),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: ConservationStatus(activeStatus: IUCNStatus.VU),
          ),
          Container(
            color: const Color(0xffE3E5E5),
            child: const SizedBox(
              height: 1,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: _buildContents(animal.contents),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(Animal animal) {
    const Color softTextColor = Color(0xffDDF8DA);

    return Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(imageUrl: animal.image.previewUrl),
            Padding(
              padding: const EdgeInsets.fromLTRB(9, 6, 9, 6),
              child: AnimalCategory(
                fontSize: 10,
                text: animal.category,
                padding: const EdgeInsets.all(6),
              ),
            ),
            Positioned.fill(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [
                            CustomColor.green.middle,
                            CustomColor.green.middle.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          color: CustomColor.green.middle,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    animal.name.displayName.trim(),
                    style: const TextStyle(
                      fontSize: 20,
                      height: 18 / 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: softTextColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    animal.name.latinName,
                    style: const TextStyle(
                      height: 1.5,
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: softTextColor,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                ),
              ],
            ),
          ),
        )
      ],
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

      return BulletList(children: children.map(_buildContent).toList());
    }
    if (content.type == "listitem") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content.children.map(_buildContent).toList(),
      );
    }
    /*if (content.type == "image") {
      return CachedNetworkImage(
        imageUrl: content.value.toString(),
      );
    }*/

    return Container();
  }
}
