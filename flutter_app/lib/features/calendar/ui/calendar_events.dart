import "package:flutter/material.dart";
import "../models/calendar_model.dart";
import "../../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "calendar_event_row.dart";

class CalendarEvents extends HookWidget {
  const CalendarEvents({super.key});

  @override
  Widget build(BuildContext context) {
    final model = useProvider<CalendarModel>(watch: true);
    final result = model.getCalendarEventsForDay(model.selectedDay);
    final theme = useTheme();

    if (model.selectedDay.year != model.focusedDay.year ||
        model.selectedDay.month != model.focusedDay.month) {
      return Container();
    }

    // Error = loading
    if (result.isError) {
      if (result.error == "none_selected") {
        return Container();
      } else if (result.error == "loading") {
        return const Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      return Container();
    }

    final events = result.success!;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: events.isEmpty
          ? Center(
              child: Text(
                "Lukket",
                style: theme.textTheme.headlineLarge,
              ),
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: Scrollable(
                viewportBuilder: (context, position) => Wrap(
                  direction: Axis.vertical,
                  spacing: 16,
                  children: events
                      .map((event) => CalendarEventRow(event: event))
                      .cast<Widget>()
                      .toList(),
                ),
              ),
            ),
    );
  }
}
