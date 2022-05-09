import "package:flutter/material.dart";
import "package:flutter_app/common/browser.dart";
import "package:flutter_app/common/colors.dart";
import "package:flutter_app/features/welcome_screen/welcome_screen.dart";
import "package:flutter_app/hooks/use_provider.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_fonts/google_fonts.dart";

import "navigation_model.dart";
import "tab_navigator.dart";

class NavigationScreen extends HookWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = useNavigator(watch: true);
    useValueChanged(navigator.selectedIndex, (oldValue, oldResult) {
      print(
        "NavigationScreen: selectedIndex changed: $oldValue -> ${navigator.selectedIndex}",
      );

      return navigator.selectedIndex;
    });

    if (!navigator.isPastWelcomeScreen) {
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
      if (index == 1) {
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
          ],
        ),
        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: navigator.showNavbar ? 48 : 0,
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              backgroundColor: CustomColor.green.lightest,
              labelTextStyle: MaterialStateProperty.all(
                GoogleFonts.poppins(
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
                  icon: Icon(Icons.home_outlined),
                  label: "Hjem",
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    "assets/menu_icons/ticket.svg",
                    color: Colors.black,
                    width: 31.5,
                    height: 24,
                  ),
                  label: "Billetter",
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    "assets/menu_icons/paw_print.svg",
                    color: Colors.black,
                    width: 31.5,
                    height: 24,
                  ),
                  label: "Vores Dyr",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
