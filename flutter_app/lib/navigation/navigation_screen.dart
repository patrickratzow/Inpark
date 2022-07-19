import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../common/browser.dart";
import "../features/welcome_screen/welcome_screen.dart";
import "../hooks/hooks.dart";
import "navigation_model.dart";
import "tab_navigator.dart";

class NavigationScreen extends HookWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = useNavigator(watch: true);

    if (navigator.shouldSeeWelcomeScreen) {
      return const Scaffold(body: WelcomeScreen());
    }

    Widget _buildOffstageNavigator(String tabItem) {
      return Offstage(
        offstage: navigator.currentPage != tabItem,
        child: TabNavigator(
          navigatorKey: navigator.getNavigatorKey(tabItem)!,
          tabItem: tabItem,
        ),
      );
    }

    Future _showTickets(BuildContext context) async {
      await Browser.openUrl(
        context,
        "https://shop.aalborgzoo.dk",
      );
    }

    void selectTab(int index, String tabItem) {
      if (index == 2) {
        _showTickets(context);

        return;
      }

      navigator.selectTab(index);
    }

    return WillPopScope(
      onWillPop: () async {
        final page = navigator.getNavigatorKey(navigator.currentPage);
        if (page == null) return true;
        final navigatorState = page.currentState;
        if (navigatorState == null) return true;
        final isFirstRouteInCurrentTab = !await navigatorState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (navigator.currentPage != "Page1") {
            selectTab(0, "Page1");

            return false;
          }
        }

        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator("Page1"),
            _buildOffstageNavigator("Page2"),
            _buildOffstageNavigator("Page3"),
            _buildOffstageNavigator("Page4"),
          ],
        ),
        bottomNavigationBar: SafeArea(
          bottom: false,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: navigator.showNavbar ? (Platform.isIOS ? 96 : 56) : 0,
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              child: NavigationBar(
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                onDestinationSelected: (index) =>
                    selectTab(index, pageKeys[index]),
                selectedIndex: navigator.selectedIndex,
                destinations: [
                  const NavigationDestination(
                    icon: Icon(Icons.home_outlined, size: 27.6),
                    label: "Hjem",
                  ),
                  const NavigationDestination(
                    icon: Icon(Icons.map_outlined, size: 27.6),
                    label: "Kort",
                  ),
                  NavigationDestination(
                    icon: SvgPicture.asset(
                      "assets/menu_icons/ticket.svg",
                      color: Colors.black,
                      width: 36.2,
                      height: 27.6,
                    ),
                    label: "Billetter",
                  ),
                  NavigationDestination(
                    icon: SvgPicture.asset(
                      "assets/menu_icons/paw_print.svg",
                      color: Colors.black,
                      width: 36.2,
                      height: 27.6,
                    ),
                    label: "Vores Dyr",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
