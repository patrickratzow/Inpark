import "package:flutter/material.dart";
import "package:flutter_app/common/screen.dart";
import "package:flutter_app/sdui/transformers/transformer.dart";

import "parser/parser.dart";

class ScreenWrapper extends StatelessWidget implements Screen {
  final Widget child;

  const ScreenWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class ScreenManager {
  Map<String, Screen Function(BuildContext context)> _screens = {};

  void registerScreen(String name, String input) {
    final parser = Parser();
    final element = parser.parse(input, "screen", ParserData());
    final builder = (BuildContext context) {
      return ScreenWrapper(child: Transformer.transformOne(element, context)!);
    };

    _screens[name.toLowerCase()] = builder;
  }

  Screen Function(BuildContext context)? getScreen(String name) {
    return _screens[name.toLowerCase()];
  }
}
