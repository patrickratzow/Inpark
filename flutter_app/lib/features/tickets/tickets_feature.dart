import "package:flutter/widgets.dart";

import "../../common/browser.dart";
import "../../common/feature.dart";
import "../../common/screen.dart";

abstract class NavigationTab<TPage extends NavigationPage> {
  Widget buildNavigationDestination(BuildContext context);
  TPage buildPage(BuildContext context);
  Future<bool> onEnter(BuildContext context);
  void onLeave(BuildContext context);
}

class TicketsFeature extends Feature implements NavigationTab {
  @override
  String get featureId => "tickets";

  @override
  FrontPageWidget? get frontPageMaterial => null;
  @override
  bool get isEnabled => true;

  @override
  Future setup(BuildContext context) => Future.value();

  @override
  Widget buildNavigationDestination(BuildContext context) {
    return Text("Tickets");
  }

  @override
  NavigationPage buildPage(BuildContext context) {
    // This does not have a page, so just return null
    // onEnter will prevent it from building page by returning false anyways
    return null as NavigationPage;
  }

  @override
  Future<bool> onEnter(BuildContext context) async {
    await Browser.openUrl(
      context,
      "https://shop.aalborgzoo.dk",
    );

    return false;
  }

  @override
  void onLeave(BuildContext context) {}
}
