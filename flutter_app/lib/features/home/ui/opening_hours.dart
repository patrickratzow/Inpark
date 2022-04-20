import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../../common/ui/title_bar.dart";
import "../models/home_model.dart";

class OpeningHours extends StatelessWidget {
  const OpeningHours({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleBar(
                  fontSize: 16,
                  name: "Åbningstider:",
                ),
                Consumer<HomeModel>(
                  builder: (context, value, child) {
                    if (value.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (value.error.isNotEmpty) {
                      return Center(
                        child: Text("Error ${value.error}"),
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
