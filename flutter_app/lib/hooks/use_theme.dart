import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

ThemeData useTheme({BuildContext? context}) {
  return Theme.of(context ?? useContext());
}
