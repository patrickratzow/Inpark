import "package:flutter/material.dart";
import "package:flutter_app/features/home/models/home_model.dart";
import "package:flutter_app/features/home/ui/event..dart";
import "package:flutter_app/features/home/ui/event_containter.dart";
import "package:flutter_app/features/home/ui/route_box.dart";
import "package:provider/provider.dart";
import "../../../common/ui/home_app_bar.dart";
import "../../../common/ui/title_bar.dart";
import "package:flutter/foundation.dart" show kDebugMode;

import "navigation_link.dart";
import "navigation_link_list.dart";
import "opening_hours.dart";

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
        route: "/animals/conservation-status-overview",
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
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: OpeningHours(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: EventContainer(title: "Kommende arrangementer:"),
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
