import "package:flutter/material.dart";
import 'package:flutter_app/common/ui/screen_app_bar.dart';
import 'package:flutter_app/features/animals/ui/animal/animal_overview_screen.dart';
import 'package:flutter_app/features/animals/ui/animal/animal_screen.dart';
import 'package:flutter_app/features/animals/ui/conservation/conservation_status_overview_screen.dart';
import 'package:flutter_app/features/calendar/calendar_screen.dart';
import "package:flutter_app/features/settings/ui/settings.dart";
import "package:flutter_app/features/speaks/ui/speak_overview_screen.dart";
import "features/home/ui/home.dart";
import "generated_code/zooinator.swagger.dart";

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (_) => const Home());
      case "/animals":
        return MaterialPageRoute(builder: (_) => const AnimalOverviewScreen());
      case "/settings":
        return MaterialPageRoute(builder: (_) => const Settings());
      case "/animals/conservation-status-overview":
        return MaterialPageRoute(
          builder: (_) => const ConservationStatusOverviewScreen(),
        );
      case "/calendar":
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
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

  static void goToSpeaksScreen(context, List<SpeakDto> speaks) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SpeaksOverviewScreen(speaks: speaks),
      ),
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
        appBar: ScreenAppBar(title: "Side ikke fundet"),
        body: const Center(
          child: Text("Vi arbejder på at få tilføjet det :)"),
        ),
      );
    });
  }
}
