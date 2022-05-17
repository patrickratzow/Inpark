import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:intl/intl.dart";

import "../../../common/browser.dart";
import "../../../common/colors.dart";
import "../../../common/screen.dart";
import "../../../common/ui/fullscreen_image.dart";
import "../../../common/ui/navigation_bar.dart";
import "../../../common/ui/screen_app_bar.dart";
import "../../../generated_code/zooinator.models.swagger.dart";
import "../../../hooks/hooks.dart";

class ParkEventScreen extends HookWidget implements Screen {
  ParkEventScreen({Key? key, required this.parkEvent}) : super(key: key);

  final ParkEventDto parkEvent;
  //This value is used to ensure no double spacers are used.
  bool wasLastNodeSpacer = false;
  final DateFormat endFormatter = DateFormat("d. MMMM yyyy", "da");
  final DateFormat startFormatter = DateFormat("d. MMMM", "da");
  final DateFormat soloStartFormatter = DateFormat("d. MMMM yyyy", "da");
  static const Color softTextColor = Color(0xffDDF8DA);

  @override
  Widget build(BuildContext context) {
    final navigator = useNavigator();

    return Scaffold(
      appBar: const ScreenAppBar(title: "Arrangement"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => {
                navigator.push(
                  context,
                  FullScreenImage(
                    imageUrl: parkEvent.image.previewUrl,
                    tag: "event-${parkEvent.title}",
                    title: parkEvent.title.toString(),
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
                        padding: const EdgeInsets.all(16),
                        child: _buildContents(
                          parkEvent.descriptionContent,
                          context,
                        ),
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
                padding: const EdgeInsets.all(16),
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
    return HookBuilder(
      builder: (BuildContext context) {
        final theme = useTheme();
        final date = useDateRange(parkEvent.start, parkEvent.end);

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
                        style: theme.textTheme.headlineMedium?.copyWith(
                          height: 18 / 20,
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
                        date,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.5,
                          color: softTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildTriviaContents(List<ContentDto> contents) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [...contents[1].children.map(_buildTriviaContent)],
          ),
        )
      ],
    );
  }

/*
final transformer = useTransformer()
  ..on("callToAction", (node, widget) {
    return 
  })
*/

  InlineSpan _buildTriviaContent(ContentDto content) {
    if (content.type == "spacer" && wasLastNodeSpacer != true) {
      wasLastNodeSpacer = true;
      return const TextSpan(
        style: TextStyle(
          color: Colors.black,
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
        ),
        children: content.children.map(_buildText).toList(),
      );
    } else if (content.type == "strong") {
      wasLastNodeSpacer = false;
      return TextSpan(
        style: const TextStyle(
          color: Colors.black,
        ),
        children: content.children.map(_buildText).toList(),
      );
    } else if (content.type == "text") {
      wasLastNodeSpacer = false;
      return TextSpan(
        style: const TextStyle(
          color: Colors.black,
        ),
        text: content.value,
      );
    } else {
      return const TextSpan();
    }
  }

  Widget _buildContents(List<ContentDto> contents, BuildContext context) {
    return Column(
      children: contents.map((x) => _buildContent(x, context)).toList(),
    );
  }

  Widget _buildContent(ContentDto content, BuildContext context) {
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
        child: SizedBox(
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
        ),
        children: content.children.map(_buildText).toList(),
      );
    } else if (content.type == "strong") {
      wasLastNodeSpacer = false;
      return TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        children: content.children.map(_buildText).toList(),
      );
    } else if (content.type == "text") {
      wasLastNodeSpacer = false;
      return TextSpan(
        style: const TextStyle(
          color: Colors.black,
        ),
        text: content.value,
      );
    } else {
      return const TextSpan();
    }
  }
}
