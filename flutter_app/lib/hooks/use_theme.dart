part of "hooks.dart";

ThemeData useTheme({BuildContext? context}) {
  return Theme.of(context ?? useContext());
}
