part of "hooks.dart";

NavigationModel useNavigator({
  bool watch = false,
  BuildContext? context = null,
}) =>
    useProvider<NavigationModel>(
      watch: watch,
      context: context,
    );
