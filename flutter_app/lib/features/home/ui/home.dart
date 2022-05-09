import "package:flutter/material.dart";
import "package:flutter_app/common/screen.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import "package:flutter_app/features/animals/ui/animal/animals_page.dart";
import "package:flutter_app/features/home/models/home_model.dart";
import "package:flutter_app/features/park_events/ui/event_containter.dart";
import "package:flutter_app/features/speaks/models/speak_model.dart";
import "package:flutter_app/features/speaks/ui/speaks_list.dart";
import "package:provider/provider.dart";
import "../../../common/ui/home_app_bar.dart";
import "../../../common/ui/title_bar.dart";

import "opening_hours.dart";

class HomeScreen extends StatelessWidget implements Screen {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeModel>().fetchOpeningHoursForToday();
    context.read<SpeakModel>().fetchSpeaksForToday();

    return Scaffold(
      appBar: const HomeAppBar(),
      body: ListView(
        children: [
          const OpeningHours(),
          const SizedBox(height: 24),
          const EventContainer(
            title: "Kommende arrangementer",
          ),
          const SizedBox(height: 24),
          _buildSpeaks(context),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSpeaks(BuildContext context) {
    return Consumer<SpeakModel>(
      builder: (context, value, child) {
        if (value.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (value.error.isNotEmpty) {
          return const Center(
            child: Text("Der skete desværre en fejl"),
          );
        }

        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TitleBar(name: "Dagens speaks", fontSize: 16),
            ),
            const SizedBox(height: 4),
            SpeaksList(speaks: value.speaks),
          ],
        );
      },
    );
  }
}

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const TabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.tabItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "Page1") {
      child = const HomeScreen();
    } else if (tabItem == "Page2") {
      child = const Text("Page 2");
    } else {
      child = const AnimalsScreen();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child,
        );
      },
      onUnknownRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              appBar: ScreenAppBar(title: "Side ikke fundet"),
              body: Center(
                child: Text("Vi arbejder på at få tilføjet det :)"),
              ),
            );
          },
        );
      },
    );
  }
}
