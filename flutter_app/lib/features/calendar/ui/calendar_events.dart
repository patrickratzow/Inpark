import "package:flutter/material.dart";
import "package:flutter_app/features/calendar/models/calendar_model.dart";
import "package:flutter_app/hooks/use_provider.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "calendar_event_row.dart";

class CalendarEvents extends HookWidget {
  const CalendarEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = useProvider<CalendarModel>(watch: true);
    final result = model.getTodaysEvents();

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
          ? const Center(
              child: Text(
                "Lukket",
                style: TextStyle(fontSize: 24),
              ),
            )
          : Wrap(
              direction: Axis.vertical,
              spacing: 16,
              children: events
                  .map((event) => CalendarEventRow(event: event))
                  .cast<Widget>()
                  .toList(),
            ),
    );
  }
}
