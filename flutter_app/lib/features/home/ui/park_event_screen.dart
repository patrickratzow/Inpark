import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";

import '../../../common/colors.dart';
import '../../../common/ui/bullet_list.dart';
import '../../../common/ui/fullscreen_image.dart';
import '../../../common/ui/navigation_bar.dart';
import '../../../generated_code/zooinator.models.swagger.dart';
import '../../../routes.dart';

class ParkEventScreen extends StatelessWidget {
  const ParkEventScreen({Key? key, required this.parkEvent}) : super(key: key);

  final ParkEventDto parkEvent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arrangement"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.13),
                    offset: const Offset(0, 0),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Card(
                margin: const EdgeInsets.all(0),
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
                              imageUrl: parkEvent.image.fullscreenUrl,
                              tag: "huh",
                              title: parkEvent.title,
                            ),
                          ),
                        ),
                      },
                      child: _buildImage(parkEvent),
                    ),
                    ZooinatorNavigationBar(
                      tabs: [
                        ZooinatorNavigationTab(
                          text: "Information",
                          icon: Icons.menu,
                          builder: (context) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: _buildContents(
                                    parkEvent.descriptionContent),
                              ),
                            ],
                          ),
                        ),
                        ZooinatorNavigationTab(
                          text: "Program",
                          icon: Icons.menu,
                          builder: (context) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: _buildContents(parkEvent.programContent),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(ParkEventDto parkEvent) {
    const Color softTextColor = Color(0xffDDF8DA);

    return Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(imageUrl: parkEvent.image.previewUrl),
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
                    parkEvent.title,
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
                    parkEvent.title,
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
          fontSize: 14,
          color: Colors.black.withOpacity(0.6),
          height: 1.35,
        ),
      );
    }
    if (content.type == "spacer") {
      return const SizedBox(height: 4);
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
    if (content.type == "image") {
      return CachedNetworkImage(
        imageUrl: content.value.toString(),
      );
    }

    return Container();
  }
}
