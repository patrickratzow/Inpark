part of "hooks.dart";

NavigationModel useNavigator({bool watch = false}) =>
    useProvider<NavigationModel>(watch: watch);
