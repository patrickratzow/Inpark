import "package:flutter/material.dart";
import 'package:flutter_app/features/animals/ui/animal/animal_overview_screen.dart';
import 'package:flutter_app/features/animals/ui/animal/animal_screen.dart';
import 'package:flutter_app/features/animals/ui/conservation/conservation_status_overview_screen.dart';
import "package:flutter_app/features/settings/ui/settings.dart";
import "package:flutter_app/screens/zoomain.dart";
import "package:flutter_app/screens/zooview.dart";
import "features/home/ui/home.dart";
import "generated_code/zooinator.swagger.dart";

class Routes {
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
        return MaterialPageRoute(builder: (_) => const AnimalOverviewScreen());
      case "/settings":
        return MaterialPageRoute(builder: (_) => const Settings());
      case "/animals/conservation-status-overview":
        return MaterialPageRoute(
          builder: (_) => const ConservationStatusOverviewScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static void goToRoute(context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  static void popPage(context) {
    Navigator.of(context).pop();
  }

  static void goToAnimalScreen(context, AnimalDto animal) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => AnimalScreen(animal: animal)),
    );
  }

  static void goToConversationOverviewScreen(context, IUCNStatusDto status) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            ConservationStatusOverviewScreen(highlightedStatus: status),
      ),
    );
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
