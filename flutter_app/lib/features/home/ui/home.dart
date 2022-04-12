import 'package:flutter/material.dart';
import 'package:flutter_app/features/home/models/home_model.dart';
import 'package:flutter_app/features/home/ui/route_box.dart';
import 'package:provider/provider.dart';
import '../../../common/ui/home_app_bar.dart';
import '../../../common/ui/title_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    var model = context.read<HomeModel>();
    return Scaffold(
      appBar: const HomeAppBar(name: 'Menu', route: 'Route'),
      body: Column(children: [
        TitleBar(name: model.greetingText()),
        const RouteBox(
            title: 'Tickets',
            route: 'Non',
            description: 'Buy your Ticket today!',
            iconName: 'ticket'),
        const RouteBox(
            title: 'Animals',
            route: '/animals',
            description: 'See all our animals!',
            iconName: 'pawprint'),
        const RouteBox(
            title: 'Activities calendar',
            route: 'Non',
            description: 'Check our future activities and events',
            iconName: 'calendar'),
        const RouteBox(
            title: 'News',
            route: 'Non',
            description: 'Read and sgin up for our newsletter',
            iconName: 'newspaper'),
        const RouteBox(
            title: 'Address',
            route: 'Non',
            description: 'Find us!',
            iconName: 'map'),
      ]),
    );
  }
}
