import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../../../common/browser.dart";
import "../../../common/colors.dart";
import "../../../common/ui/fullscreen_image.dart";
import "../../../common/ui/navigation_bar.dart";
import "../../../common/ui/screen_app_bar.dart";
import "../../../generated_code/zooinator.models.swagger.dart";

class ParkEventScreen extends StatelessWidget {
  ParkEventScreen({Key? key, required this.parkEvent, required this.context})
      : super(key: key);

  final ParkEventDto parkEvent;
  //This value is used to ensure no double spacers are used.
  bool wasLastNodeSpacer = false;
  final DateFormat formatter = DateFormat("dd-MMM-yyyy", "da");
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScreenAppBar(title: "Arrangement"),
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
                              tag: "event-${parkEvent.title}",
                              title: parkEvent.title.toString(),
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
                        ..._getProgramTab(parkEvent),
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

  List<ZooinatorNavigationTab> _getProgramTab(ParkEventDto parkEvent) {
    if (parkEvent.programContent.isEmpty) {
      return List.empty();
    } else {
      return [
        ZooinatorNavigationTab(
          text: "Program",
          icon: Icons.menu,
          builder: (context) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: _buildTriviaContents(
                  parkEvent.programContent,
                ),
              ),
            ],
          ),
        )
      ];
    }
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
                    formatter.format(parkEvent.start),
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

  Widget _buildTriviaContents(List<ContentDto> contents) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              children: [...contents[1].children.map(_buildTriviaContent)]),
        )
      ],
    );
  }

  InlineSpan _buildTriviaContent(ContentDto content) {
    if (content.type == "spacer" && wasLastNodeSpacer != true) {
      wasLastNodeSpacer = true;
      return const TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
        ),
        text: "\n\n",
      );
    } else if (content.type == "list") {
      return TextSpan(
        children: content.children.map(_buildText).toList(),
      );
    } else if (content.type == "listitem") {
      return TextSpan(
        text: "• ",
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
        ),
        children: content.children.map(_buildText).toList(),
      );
    } else if (content.type == "strong") {
      wasLastNodeSpacer = false;
      return TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
        ),
        children: content.children.map(_buildText).toList(),
      );
    } else if (content.type == "text") {
      wasLastNodeSpacer = false;
      return TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
        ),
        text: content.value,
      );
    } else {
      return const TextSpan();
    }
  }

  Widget _buildContents(List<ContentDto> contents) {
    return Column(
      children: contents.map(_buildContent).toList(),
    );
  }

  Widget _buildContent(ContentDto content) {
    if (content.type == "container") {
      return RichText(
        text: TextSpan(children: [...content.children.map(_buildText)]),
      );
    }
    if (content.type == "image") {
      return CachedNetworkImage(
        imageUrl: content.value.toString(),
      );
    }
    if (content.type == "callToAction") {
      return Padding(
        padding: const EdgeInsets.only(top: 32, bottom: 16),
        child: Container(
          width: double.infinity,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(CustomColor.green.middle),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            child: const Text(
              "Køb billet",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
              ),
            ),
            onPressed: () => Browser.openUrl(
              context,
              "https://shop.aalborgzoo.dk/arrangementer",
            ),
          ),
        ),
      );
    }
    return Container();
  }

  InlineSpan _buildText(ContentDto content) {
    if (content.type == "spacer" && wasLastNodeSpacer != true) {
      wasLastNodeSpacer = true;
      return const TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
        ),
        text: "\n\n",
      );
    } else if (content.type == "list") {
      return TextSpan(
        children: content.children.map(_buildText).toList(),
      );
    } else if (content.type == "listitem") {
      return TextSpan(
        text: "• ",
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
        ),
        children: content.children.map(_buildText).toList(),
      );
    } else if (content.type == "strong") {
      wasLastNodeSpacer = false;
      return TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins",
        ),
        children: content.children.map(_buildText).toList(),
      );
    } else if (content.type == "text") {
      wasLastNodeSpacer = false;
      return TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
        ),
        text: content.value,
      );
    } else {
      return const TextSpan();
    }
  }
}
