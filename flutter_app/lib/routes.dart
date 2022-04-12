import "package:flutter/material.dart";
import "package:flutter_app/screens/zoomain.dart";
import "package:flutter_app/screens/zooview.dart";
import "features/animals/ui/animal_overview_screen.dart";
import "features/animals/ui/animal_screen.dart";
import "features/home/ui/home.dart";

class Routes {
  Map<String, WidgetBuilder> build(BuildContext context) {
    return {
      "/home": (context) => const Home(),
      "/zooView": (context) => const ZooView(),
      "/zooMainView": (context) => const ZooMainView(),
      "/animals": (context) => AnimalOverviewScreen(),
      "/animals/id": (context) => const AnimalScreen(),
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (_) => const Home());
      case "/zooView":
        return MaterialPageRoute(builder: (_) => const ZooPage(title: "Zoo"));
      case "/zooMainView>":
        return MaterialPageRoute(builder: (_) => const ZooMainView());
      case "/animals":
        return MaterialPageRoute(builder: (_) => AnimalOverviewScreen());
      case "/animals/id":
        return MaterialPageRoute(builder: (_) => const AnimalScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("ERROR"),
        ),
        body: const Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}
