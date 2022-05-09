import "package:flutter/material.dart";
import "package:flutter_app/common/screen.dart";
import 'package:localstorage/localstorage.dart';

final List<String> pageKeys = ["Page1", "Page2", "Page3"];
final Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
  "Page1": GlobalKey<NavigatorState>(),
  "Page2": GlobalKey<NavigatorState>(),
  "Page3": GlobalKey<NavigatorState>(),
};

class NavigationModel extends ChangeNotifier {
  final LocalStorage _localStorage = LocalStorage("navigator.json");

  bool _isPastWelcomeScreen = false;
  bool get isPastWelcomeScreen =>
      _isPastWelcomeScreen ||
      _localStorage.getItem("past_welcome_screen") != null;
  bool _showNavbar = true;
  bool get showNavbar => _showNavbar;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  String get currentPage => pageKeys[selectedIndex];
  int? _hiddenStackIndex;

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

  void pushHome(BuildContext context) {
    _isPastWelcomeScreen = true;
    _localStorage.setItem("past_welcome_screen", true);

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
                })
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
