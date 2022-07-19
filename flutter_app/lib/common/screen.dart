// Used as an interface for navigation
import "package:flutter/widgets.dart";

abstract class Screen extends Widget {
  const Screen({super.key});
}

abstract class NavigationPage extends Screen {
  const NavigationPage({super.key});

  void onEnter(BuildContext context);
  void onLeave(BuildContext context);
}
