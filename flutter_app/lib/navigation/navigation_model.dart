import "package:flutter/material.dart";
import "package:flutter_app/common/screen.dart";

final List<String> pageKeys = ["Page1", "Page2", "Page3"];
final Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
  "Page1": GlobalKey<NavigatorState>(),
  "Page2": GlobalKey<NavigatorState>(),
  "Page3": GlobalKey<NavigatorState>(),
};

class NavigationModel extends ChangeNotifier {
  bool _isPastIntro = false;
  bool get isPastIntro => _isPastIntro;
  bool _showNavbar = true;
  bool get showNavbar => _showNavbar;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  String get currentPage => pageKeys[selectedIndex];

  void selectTab(int index) {
    _selectedIndex = index;

    notifyListeners();
  }

  void hide() {
    _showNavbar = false;

    notifyListeners();
  }

  void show() {
    _showNavbar = true;

    notifyListeners();
  }

  void pushHome(BuildContext context) {
    _isPastIntro = true;

    notifyListeners();
  }

  void replace<T extends Screen>(BuildContext context, T screen) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  void push<T extends Screen>(BuildContext context, T screen) {
    Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  GlobalKey<NavigatorState>? getNavigatorKey(String tabItem) =>
      navigatorKeys[tabItem];
}
