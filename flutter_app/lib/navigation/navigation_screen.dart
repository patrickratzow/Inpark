import "package:flutter/material.dart";
import "package:flutter_app/common/browser.dart";
import "package:flutter_app/features/front_page/front_page.dart";
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
    final navigation = useProvider<NavigationModel>(watch: true);

    if (!navigation.isPastIntro) {
      return const Scaffold(body: FrontPage());
    }

    Widget _buildOffstageNavigator(String tabItem) {
      return Offstage(
        offstage: navigation.currentPage != tabItem,
        child: TabNavigator(
          navigatorKey: navigation.getNavigatorKey(tabItem)!,
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

      navigation.selectTab(index);
    }

    return WillPopScope(
      onWillPop: () async {
        final page = navigation.getNavigatorKey(navigation.currentPage);
        if (page == null) return true;
        final navigator = page.currentState;
        if (navigator == null) return true;
        final isFirstRouteInCurrentTab = !await navigator.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (navigation.currentPage != "Page1") {
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
        bottomNavigationBar: !navigation.showNavbar
            ? null
            : NavigationBarTheme(
                data: NavigationBarThemeData(
                  labelTextStyle: MaterialStateProperty.all(
                    GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                child: NavigationBar(
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                  height: 48,
                  onDestinationSelected: (index) =>
                      selectTab(index, pageKeys[index]),
                  selectedIndex: navigation.selectedIndex,
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
    );
  }
}
