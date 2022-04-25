import "package:flutter/material.dart";
import 'package:flutter_app/routes.dart';
import "package:provider/provider.dart";

import "../../../common/ui/title_bar.dart";
import "../models/home_model.dart";

class OpeningHours extends StatelessWidget {
  const OpeningHours({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Theme.of(context).splashColor,
      onTap: () {
        Routes.goToRoute(context, "opening-hours");
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleBar(
                  fontSize: 16,
                  name: "Åbningstider",
                ),
                Consumer<HomeModel>(
                  builder: (context, value, child) {
                    if (value.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (value.error.isNotEmpty) {
                      return const Center(
                        child: Text(
                          "Ingen åbningstider tilgængelig, prøv igen senere",
                        ),
                      );
                    }

                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value.openingHours,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "Poppins",
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
