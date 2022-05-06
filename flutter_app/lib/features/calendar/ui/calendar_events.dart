import "package:flutter/material.dart";
import 'package:flutter_app/common/extensions/iterable.dart';
import "package:flutter_app/features/calendar/models/calendar_model.dart";
import "package:provider/provider.dart";

import "calendar_event_row.dart";

class CalendarEvents extends StatelessWidget {
  const CalendarEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarModel>(
      builder: (context, model, child) {
        var result = model.getTodaysEvents();
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

        Widget body;
        var events = result.success!;
        if (events.isEmpty) {
          body = const Center(
            child: Text(
              "Lukket",
              style: TextStyle(fontSize: 24),
            ),
          );
        } else {
          body = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: events
                .mapIndexed((event, index, isLast) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
                    child: CalendarEventRow(event: event),
                  );
                })
                .cast<Widget>()
                .toList(),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: body,
        );
      },
    );
  }
}
