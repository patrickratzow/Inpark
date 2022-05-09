part of "use_provider.dart";

NavigationModel useNavigator({bool watch = false}) =>
    useProvider<NavigationModel>(watch: watch);
