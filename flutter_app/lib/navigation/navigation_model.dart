import "package:flutter/material.dart";
import "package:localstorage/localstorage.dart";

import "../common/screen.dart";

final List<String> pageKeys = ["Page1", "Page2", "Page3", "Page4"];
final Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
  "Page1": GlobalKey<NavigatorState>(),
  "Page2": GlobalKey<NavigatorState>(),
  "Page3": GlobalKey<NavigatorState>(),
  "Page4": GlobalKey<NavigatorState>(),
};

class NavigationModel extends ChangeNotifier {
  static final LocalStorage _localStorage = LocalStorage("navigator.json");

  bool _shouldSeeWelcomeScreen = false;
  bool get shouldSeeWelcomeScreen => _shouldSeeWelcomeScreen;
  bool _showNavbar = true;
  bool get showNavbar => _showNavbar;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  String get currentPage => pageKeys[selectedIndex];
  int? _hiddenStackIndex;

  NavigationModel() {
    _localStorage.ready.then((_) {
      _shouldSeeWelcomeScreen =
          _localStorage.getItem("has_seen_welcome_screen") == null;
    });
  }

  void selectTab(int index) {
    _selectedIndex = index;

    notifyListeners();
  }

  void hide() {
    _hiddenStackIndex = 0;
    _showNavbar = false;

    notifyListeners();
  }

  void show() {
    _hiddenStackIndex = null;
    _showNavbar = true;

    notifyListeners();
  }

  void hasSeenWelcomeScreen() {
    _shouldSeeWelcomeScreen = false;
    _localStorage.setItem("has_seen_welcome_screen", true);

    notifyListeners();
  }

  void replace<T extends Screen>(BuildContext context, T screen) {
    _hiddenStackIndex = null;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  void push<T extends Screen>(BuildContext context, T screen, {hide = false}) {
    if (hide) this.hide();
    if (_hiddenStackIndex != null) _hiddenStackIndex = (_hiddenStackIndex! + 1);

    Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (context) => hide
            ? WillPopScope(
                child: screen,
                onWillPop: () async {
                  show();

                  return true;
                },
              )
            : screen,
      ),
    );
  }

  void pop(BuildContext context) {
    if (_hiddenStackIndex != null) _hiddenStackIndex = (_hiddenStackIndex! - 1);
    if (_hiddenStackIndex == 0) show();

    Navigator.of(context).pop();
  }

  GlobalKey<NavigatorState>? getNavigatorKey(String tabItem) =>
      navigatorKeys[tabItem];
}
