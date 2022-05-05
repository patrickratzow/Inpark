import "package:flutter/material.dart";
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_app/common/browser.dart';
import "package:flutter_app/features/home/models/home_model.dart";
import "package:flutter_app/features/home/ui/event..dart";
import "package:flutter_app/features/home/ui/event_containter.dart";
import "package:flutter_app/features/home/ui/route_box.dart";
import 'package:flutter_app/features/home/ui/speaks_list.dart';
import 'package:flutter_app/features/speaks/models/speak_model.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import "package:provider/provider.dart";
import "../../../common/ui/home_app_bar.dart";
import "../../../common/ui/title_bar.dart";
import "package:flutter/foundation.dart" show kDebugMode;

import "navigation_link.dart";
import "navigation_link_list.dart";
import "opening_hours.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
            child: NavigationLinkList(
              children: [
                NavigationLink(
                  iconName: "ticket",
                  text: "Billetter",
                  onPressed: () => Browser.openUrl(
                    context,
                    "https://shop.aalborgzoo.dk/arrangementer",
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
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 14, 0, 16),
            child: EventContainer(
              title: "Kommende arrangementer",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildSpeaks(context),
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
              name: "Dagens speaks",
            ),
          ),
          SpeaksList(speaks: value.speaks),
        ];

        return Column(
          children: widgets,
        );
      },
    );
  }
}
