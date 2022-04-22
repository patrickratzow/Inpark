import "package:flutter/material.dart";
import 'package:flutter_app/common/colors.dart';
import "package:flutter_app/features/home/models/home_model.dart";
import "package:flutter_app/features/home/ui/route_box.dart";
import 'package:flutter_app/features/home/ui/speaks_preview.dart';
import "package:provider/provider.dart";
import "../../../common/ui/home_app_bar.dart";
import "../../../common/ui/title_bar.dart";
import "package:flutter/foundation.dart" show kDebugMode;

import 'navigation_link.dart';
import 'navigation_link_list.dart';
import 'opening_hours.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  List<Widget> _buildDebugRoutes(BuildContext context) {
    if (!kDebugMode) {
      return List.empty();
    }
    return [
      const RouteBox(
        title: "Floris",
        route: "/settings",
        description: "Find us!",
        iconName: "map",
      ),
      const RouteBox(
        title: "Patrick",
        route: "Non",
        description: "Find us!",
        iconName: "map",
      ),
      const RouteBox(
        title: "Nikolaj",
        route: "Non",
        description: "Find us!",
        iconName: "map",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeModel>().fetchOpeningHoursForToday();

    return Scaffold(
      appBar: const HomeAppBar(title: "Hello Patrick!"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  OpeningHours(),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: NavigationLinkList(
                      navLinkArr: [
                        NavigationLink(
                          iconName: "ticket",
                          text: "Ticket",
                          route: "non",
                        ),
                        NavigationLink(
                          iconName: "calendar",
                          text: "Activities calendar",
                          route: "non",
                        ),
                        NavigationLink(
                          iconName: "map",
                          text: "Address",
                          route: "non",
                        ),
                        NavigationLink(
                          iconName: "pawprint",
                          text: "Animals",
                          route: "/animals",
                        ),
                        NavigationLink(
                          iconName: "newspaper",
                          text: "News",
                          route: "non",
                        ),
                      ],
                      title: "Tasks",
                    ),
                  ),
                  SpeaksPreview(),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: CustomColor.green.lightest,
                      padding: const EdgeInsets.all(8.0),
                      primary: CustomColor.green.darkest,
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                    child: const Text("Vis alle speaks for dagen"),
                  ),
                  ..._buildDebugRoutes(context),
                  const RouteBox(
                    title: "Vores Dyr",
                    route: "/animals",
                    description: "Se alle de dyr vi har!",
                    iconName: "pawprint",
                  ),
                  const RouteBox(
                    title: "Billetter",
                    route: "Non",
                    description: "Køb din billet i dag!",
                    iconName: "ticket",
                  ),
                  const RouteBox(
                    title: "Arrangementer",
                    route: "Non",
                    description:
                        "Se vores nuværende og fremtidige arrangementer",
                    iconName: "calendar",
                  ),
                  const RouteBox(
                    title: "News",
                    route: "Non",
                    description: "Læs vores nyhedsbrev",
                    iconName: "newspaper",
                  ),
                  const RouteBox(
                    title: "Kort",
                    route: "Non",
                    description: "Få et kort over hele parken!",
                    iconName: "map",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
