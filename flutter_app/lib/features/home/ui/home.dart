import "package:flutter/material.dart";
import "package:flutter_app/features/home/models/home_model.dart";
import "package:flutter_app/features/home/ui/route_box.dart";
import "package:provider/provider.dart";
import "../../../common/ui/home_app_bar.dart";
import "../../../common/ui/title_bar.dart";
import "package:flutter/foundation.dart" show kDebugMode;

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
      appBar: const HomeAppBar(name: "Menu", route: "Route"),
      body: Column(
        children: [
          Consumer<HomeModel>(
            builder: (context, value, child) {
              if (value.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (value.error.isNotEmpty) {
                return Center(
                  child: Text("Fejl"),
                );
              }

              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value.openingHours,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: ListView(
              children: [
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
                  description: "Se vores nuværende og fremtidige arrangementer",
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
    );
  }
}
