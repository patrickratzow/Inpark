import "package:flutter/material.dart";
import "package:flutter_app/common/browser.dart";
import "package:flutter_app/features/home/models/home_model.dart";
import 'package:flutter_app/features/park_events/ui/event.dart';
import 'package:flutter_app/features/park_events/ui/event_container.dart';
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
          NavigationLinkList(
            children: [
              NavigationLink(
                iconName: "ticket",
                text: "Billetter",
                onPressed: () => Browser.openUrl(
                  context,
                  "https://shop.aalborgzoo.dk",
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
          _buildSpeaks(context),
          const EventContainer(
            title: "Kommende arrangementer",
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
