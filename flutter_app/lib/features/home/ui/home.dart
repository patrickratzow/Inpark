import "package:flutter/material.dart";
import 'package:flutter_app/common/colors.dart';
import "package:flutter_app/features/home/models/home_model.dart";
import "package:flutter_app/features/home/ui/event..dart";
import "package:flutter_app/features/home/ui/event_containter.dart";
import "package:flutter_app/features/home/ui/route_box.dart";
import 'package:flutter_app/features/home/ui/speaks_preview.dart';
import 'package:flutter_app/features/speaks/models/speak_model.dart';
import "package:provider/provider.dart";
import "../../../common/ui/home_app_bar.dart";
import "../../../common/ui/title_bar.dart";
import "package:flutter/foundation.dart" show kDebugMode;

import '../../../routes.dart';
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
          const Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 0, 0),
            child: NavigationLinkList(
              children: [
                NavigationLink(
                  iconName: "ticket",
                  text: "Billetter",
                  route: "non",
                ),
                NavigationLink(
                  iconName: "calendar",
                  text: "Aktivitets\nkalender",
                  route: "non",
                ),
                NavigationLink(
                  iconName: "pawprint",
                  text: "Vores Dyr",
                  route: "/animals",
                ),
                NavigationLink(
                  iconName: "newspaper",
                  text: "Nyheder",
                  route: "non",
                ),
              ],
              title: "Tasks",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildSpeaks(context),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: EventContainer(
              title: "Kommende arrangementer",
              eventArr: [
                Event(
                  title: "Tiger besøg",
                  description:
                      "Træt af dine børn, nu kan du smide dem ind til tigerne!",
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

        List<Widget> widgets = [
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: TitleBar(
              fontSize: 16,
              name: "Aktiviteter & Speaks i dag",
            ),
          ),
          SpeaksList(speaks: value.topThreeSpeaks),
        ];

        return Column(
          children: widgets,
        );
      },
    );
  }
}
