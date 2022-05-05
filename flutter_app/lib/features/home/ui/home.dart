import "package:flutter/material.dart";
import "package:flutter_app/common/browser.dart";
import "package:flutter_app/features/home/models/home_model.dart";
import "package:flutter_app/features/home/ui/event..dart";
import "package:flutter_app/features/home/ui/event_containter.dart";
import "package:flutter_app/features/home/ui/route_box.dart";
import "package:flutter_app/features/speaks/models/speak_model.dart";
import "package:flutter_app/features/speaks/ui/speaks_list.dart";
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
    context.read<SpeakModel>().fetchSpeaksForToday();

    return Scaffold(
      appBar: const HomeAppBar(),
      body: ListView(
        children: [
          const OpeningHours(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 0, 0),
            child: NavigationLinkList(
              children: [
                NavigationLink(
                  iconName: "ticket",
                  text: "Billetter",
                  onPressed: () => Browser.openUrl(
                    context,
                    "https://shop.aalborgzoo.dk/entrebilletter",
                  ),
                ),
                const NavigationLink(
                  iconName: "calendar",
                  text: "Aktivitets\nkalender",
                  route: "non",
                ),
                const NavigationLink(
                  iconName: "pawprint",
                  text: "Vores Dyr",
                  route: "/animals",
                ),
                const NavigationLink(
                  iconName: "newspaper",
                  text: "Nyheder",
                  route: "non",
                ),
              ],
              title: "Tasks",
            ),
          ),
          _buildSpeaks(context),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: EventContainer(
              title: "Kommende arrangementer",
              eventArr: [
                Event(
                  title: "Dyrepasser for en dag",
                  description: "30. april 2022 - 1. maj 2022",
                  imageUrl:
                      "https://cms.aalborgzoo.dk/media/b3slg21y/efter%C3%A5rsferie-700x350.jpg?width=592",
                  route: "non",
                ),
                Event(
                  title: "Morgenrundvisning",
                  description: "22. maj 2022",
                  imageUrl:
                      "https://cms.aalborgzoo.dk/media/ijkpfwi0/vinterferie_2021-700x350.jpg?width=592",
                  route: "non",
                ),
                /*
                Event(
                  title: "Søløve besøg",
                  description:
                      "Træt af dine børn, nu kan du smide dem ind til søløverne!",
                  imageUrl:
                      "https://cms.aalborgzoo.dk/media/yz1pdqpt/nyhedsbrev-700x350.jpg",
                  route: "non",
                ),
                */
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpeaks(BuildContext context) {
    return Consumer<SpeakModel>(
      builder: (context, value, child) {
        if (value.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (value.error.isNotEmpty) {
          return const Center(
            child: Text("Der skete desværre en fejl"),
          );
        }

        return Padding(
          padding: EdgeInsets.fromLTRB(0, 14, 0, 16),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TitleBar(name: "Dagens speaks", fontSize: 16),
              ),
              SizedBox(height: 4),
              SpeaksList(speaks: value.speaks),
            ],
          ),
        );
      },
    );
  }
}
