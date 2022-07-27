import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../common/ui/screen_app_bar.dart";
import "../features/animals/ui/animal/animals_page.dart";
import "../features/home/ui/home.dart";
import "../features/park_map/ui/park_map_screen.dart";

class TabNavigator extends HookWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const TabNavigator({
    super.key,
    required this.navigatorKey,
    required this.tabItem,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "Page1") {
      child = const HomeScreen();
    } else if (tabItem == "Page2") {
      child = const ParkMapScreen();
    } else if (tabItem == "Page3") {
      child = const Text("Page 3");
    } else {
      child = const AnimalsScreen();
    }

    useValueChanged(tabItem, (oldValue, oldResult) {
      return tabItem;
    });

    final heroController = useMemoized(() => HeroController());

    return Navigator(
      key: navigatorKey,
      observers: [heroController],
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
