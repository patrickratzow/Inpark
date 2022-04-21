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
                    child: EventContainer(
                      title: "Today´s events:",
                      eventArr: [
                        Event(
                          title: "Tiger besøg",
                          description:
                              "Træt af dine børn, nu kan du smide dem ind til tigerne!wqoiej qoiwje qiowje qwoijeq oiwjeqoiwjeqowije qiwojeqiowjeqowiejqoiwejqoiwjeoiqwjeoiqwje oqiwjeoiqwje oiqjeoqwije",
                          imageUrl:
                              "https://cms.aalborgzoo.dk/media/k23kerj1/for-bes%C3%B8gende-700x350.jpg",
                          route: "non",
                        ),
                        Event(
                          title: "Abe besøg",
                          description:
                              "Træt af dine børn, nu kan du smide dem ind til aberne!",
                          imageUrl:
                              "https://cms.aalborgzoo.dk/media/j0ej4iqh/fest-i-vilde-omgivelser-700x350.jpg",
                          route: "non",
                        ),
                        Event(
                          title: "Søløve besøg",
                          description:
                              "Træt af dine børn, nu kan du smide dem ind til søløverne!",
                          imageUrl:
                              "https://cms.aalborgzoo.dk/media/yz1pdqpt/nyhedsbrev-700x350.jpg",
                          route: "non",
                        ),
                      ],
                    ),
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
