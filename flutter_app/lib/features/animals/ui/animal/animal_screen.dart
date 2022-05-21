import "dart:math";

import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_app/features/animals/ui/animal/animal_map.dart";
import "../../../../common/colors.dart";
import "../../../../common/extensions/theme.dart";
import "../../../../common/screen.dart";
import "../../../../common/ui/fullscreen_image.dart";
import "../../../../common/ui/navigation_bar.dart";
import "../../../../common/ui/screen_app_bar.dart";
import "../conservation/conservation_status.dart";
import "../conservation/conservation_status_overview_screen.dart";
import "../../../../generated_code/zooinator.swagger.dart";
import "../../../../hooks/hooks.dart";
import "../../../../navigation/navigation_model.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "animal_category.dart";

class AnimalScreen extends HookWidget implements Screen {
  final AnimalDto animal;

  const AnimalScreen({
    super.key,
    required this.animal,
  });

  @override
  Widget build(BuildContext context) {
    final navigation = useNavigator();
    final theme = useTheme();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: false,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            floating: true,
            flexibleSpace: ScreenAppBar(
              title: animal.name.displayName,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index != 0) return null;

                return _buildCard(context, animal, navigation, theme);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    AnimalDto animal,
    NavigationModel navigation,
    ThemeData theme,
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => {
            navigation.push(
              context,
              FullScreenImage(
                imageUrl: animal.image.fullscreenUrl,
                tag: "animal-${animal.id}",
                title: animal.name.displayName,
              ),
            ),
          },
          child: _buildImage(animal, theme),
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
                    child: _buildContent(animal.contents[0], theme),
                  ),
                ],
              ),
            ),
            ZooinatorNavigationTab(
              text: "Oversigt",
              icon: Icons.dashboard,
              builder: (context) => Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: _buildTriviaContent(animal.contents[1], theme),
              ),
            ),
            ZooinatorNavigationTab(
              text: "Kort",
              icon: Icons.map,
              builder: (context) => AnimalMap(
                data: [
                  AnimalArea(
                    color: Color(0xffff0000),
                    points: [
                      Point(46.9810379241517, 54.89973514945138),
                      Point(44.93512974051897, 60.91562618236852),
                      Point(48.37824351297405, 66.21263715474839),
                      Point(53.84231536926147, 62.88308740068105),
                      Point(52.59481037924152, 56.79152478244419),
                      Point(46.95608782435129, 55.01324252743095)
                    ],
                  ),
                  AnimalArea(
                    color: Color(0xffff0000),
                    points: [
                      Point(54.69977197871801, 67.46062235881675),
                      Point(52.47023055485178, 67.46062235881675),
                      Point(51.43146693691412, 71.18709181713407),
                      Point(53.30630858880162, 73.99154821359969),
                      Point(55.13047884469218, 75.06723011909335),
                      Point(55.71319989865721, 68.61313868613139)
                    ],
                  ),
                  AnimalArea(
                    color: Color(0xffff0000),
                    points: [
                      Point(54.5984291867241, 67.3069535151748),
                      Point(53.737015454775786, 65.84709950057626),
                      Point(54.39574360273626, 65.15558970418748),
                      Point(55.48517861667089, 65.46292739147138),
                      Point(56.16924246262984, 64.88666922781407),
                      Point(56.39726374461617, 65.34767575873992),
                      Point(56.27058525462376, 66.3465232424126),
                      Point(56.751963516594884, 66.92278140606992),
                      Point(56.57461363060552, 67.84479446792163),
                      Point(55.662528502660244, 68.65155589704187)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTriviaContent(ContentDto content, ThemeData theme) {
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
                style: theme.textTheme.bodyMedium?.copyWith(
                  height: 18 / 10,
                  color: const Color(0xff7C7C7C),
                ),
              ),
              Text(
                body,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.black,
                  height: 18 / 14,
                ),
              ),
              if (i != items.length) const SizedBox(height: 16),
            ],
          );
        },
      ).toList(),
    );

    /*
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
    */
  }

  Widget _buildConservationStatus(AnimalDto animal) {
    if (animal.status == IUCNStatusDto.unknown ||
        animal.status == IUCNStatusDto.swaggerGeneratedUnknown) {
      return Container();
    }

    return ConservationStatus(activeStatus: animal.status);
  }

  Widget _buildImage(AnimalDto animal, ThemeData theme) {
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
                    animal.name.latinName,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.5,
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

  Widget _buildContents(List<ContentDto> contents, ThemeData theme) {
    return Column(
      children: contents.map((x) => _buildContent(x, theme)).toList(),
    );
  }

  Widget _buildContent(ContentDto content, ThemeData theme) {
    if (content.type == "container") {
      return Column(
        children: content.children.map((x) => _buildContent(x, theme)).toList(),
      );
    }
    if (content.type == "text") {
      final textColor = theme.adjustColor(
        light: Colors.black,
        dark: Colors.white,
      );

      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          content.value.toString(),
          textAlign: TextAlign.left,
          softWrap: true,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: textColor.withOpacity(0.6),
            height: 1.35,
          ),
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
