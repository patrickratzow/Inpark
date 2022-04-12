import 'package:flutter/material.dart';
import 'package:flutter_app/screens/zoomain.dart';
import 'package:flutter_app/screens/zooview.dart';
import 'features/animals/ui/animal_overview_screen.dart';
import 'main.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const MyHomePage(title: "Home Page"));
      case '/zooView':
        return MaterialPageRoute(builder: (_) => const ZooPage(title: "Zoo"));
      case '/zooMainView>':
        return MaterialPageRoute(builder: (_) => const ZooMainView());
      case '/animals':
        return MaterialPageRoute(builder: (_) => const AnimalOverviewScreen());
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
          child: Text('ERROR'),
        ),
      );
    });
  }
}
