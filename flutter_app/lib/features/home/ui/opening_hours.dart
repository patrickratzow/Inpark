import "package:flutter/material.dart";

import "../../../common/feature.dart";
import "../../../common/ui/title_bar.dart";
import "../../../hooks/hooks.dart";
import "../../calendar/ui/calendar_screen.dart";
import "../models/home_model.dart";

class OpeningHours extends FrontPageWidget {
  const OpeningHours({
    super.key,
  }) : super(padding: EdgeInsets.zero);

  @override
  Widget build(BuildContext context) {
    final home = useProvider<HomeModel>(watch: true);
    final navigator = useNavigator();
    final theme = useTheme();

    if (home.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (home.error.isNotEmpty) {
      return const Center(
        child: Text(
          "Ingen åbningstider tilgængelig, prøv igen senere",
        ),
      );
    }

    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: theme.splashColor,
      onTap: () {
        navigator.push(context, const CalendarScreen());
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleBar(
                  name: "Åbningstider",
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    home.openingHours,
                    style: theme.textTheme.bodyLarge,
                  ),
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

  @override
  bool shouldHide(BuildContext context) => false;
}
