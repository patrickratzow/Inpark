import "package:flutter/material.dart";

import "../common/ui/screen_app_bar.dart";
import "../features/animals/ui/animal/animals_page.dart";
import "../features/home/ui/home.dart";

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
