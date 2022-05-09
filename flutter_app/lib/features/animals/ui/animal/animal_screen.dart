import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_app/common/colors.dart";
import "package:flutter_app/common/screen.dart";
import "package:flutter_app/common/ui/bullet_list.dart";
import "package:flutter_app/common/ui/fullscreen_image.dart";
import "package:flutter_app/common/ui/navigation_bar.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import "package:flutter_app/features/animals/ui/conservation/conservation_status.dart";
import "package:flutter_app/features/animals/ui/conservation/conservation_status_overview_screen.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";
import "package:flutter_app/hooks/use_provider.dart";
import "package:flutter_app/navigation/navigation_model.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "animal_category.dart";

class AnimalScreen extends HookWidget implements Screen {
  final AnimalDto animal;
  const AnimalScreen({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigation = useProvider<NavigationModel>();

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

                return _buildCard(context, animal, navigation);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, AnimalDto animal, NavigationModel navigation) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => {
            navigation.hide(),
            Navigator.of(context).push(
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
        ZooinatorNavigationBar(
          tabs: [
            ZooinatorNavigationTab(
              text: "Information",
              icon: Icons.menu,
              builder: (context) => Column(
                children: [
                  InkWell(
                    onTap: () => navigation.push(
                      context,
                      ConservationStatusOverviewScreen(
                        highlightedStatus: animal.status,
                      ),
                    ),
                    child: _buildConservationStatus(animal),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: _buildContent(animal.contents[0]),
                  ),
                ],
              ),
            ),
            ZooinatorNavigationTab(
              text: "Oversigt",
              icon: Icons.dashboard,
              builder: (context) => Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: _buildTriviaContent(animal.contents[1]),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTriviaContent(ContentDto content) {
    var items = content.children.first.children
        .where((child) => child.type == "listitem");

    var i = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map(
        (item) {
          i++;
          final split = item.children.first.value.split(": ");
          final title = split[0];
          final body = split.skip(1).join(": ");

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff7C7C7C),
                  height: 18 / 10,
                  fontFamily: "Poppins",
                ),
              ),
              Text(
                body,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  height: 18 / 14,
                  fontFamily: "Poppins",
                ),
              ),
              i == items.length ? Container() : const SizedBox(height: 16),
            ],
          );
        },
      ).toList(),
    );

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
  }

  Widget _buildConservationStatus(AnimalDto animal) {
    if (animal.status == IUCNStatusDto.unknown ||
        animal.status == IUCNStatusDto.swaggerGeneratedUnknown) {
      return Container();
    }

    return ConservationStatus(activeStatus: animal.status);
  }

  Widget _buildImage(AnimalDto animal) {
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
                    animal.name.displayName,
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
          fontSize: 14,
          color: Colors.black.withOpacity(0.6),
          height: 1.35,
        ),
      );
    }
    if (content.type == "spacer") {
      return const SizedBox(height: 4);
    }
    /*if (content.type == "image") {
      return CachedNetworkImage(
        imageUrl: content.value.toString(),
      );
    }*/

    return Container();
  }
}
