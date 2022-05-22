import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:provider/provider.dart";

import "../models/calendar_date_counter.dart";
import "../models/calendar_model.dart";
import "calendar_day.dart";

class CalendarMonth extends HookWidget {
  const CalendarMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarModel>(
      builder: (context, model, child) {
        var rows = <Row>[];
        var counter = CalendarDateCounter();
        var amountOfRows = model.rows;

        var offset = 0;
        for (var i = 0; i < amountOfRows; i++) {
          var children = <Widget>[];
          for (var j = 0; j < 7; j++) {
            var isActive = model.isInsideMonth(offset);
            var number = counter.increment(isActive);
            var text = number;
            var isSelected = model.selectedDay == text;

            children.add(
              Flexible(
                child: SizedBox(
                  height: 48,
                  width: 48,
                  child: isActive
                      ? CalendarDay(
                          text: text.toString(),
                          isSelected: isSelected,
                          onPressed: () {
                            model.selectDay(text);
                          },
                        )
                      : null,
                ),
              ),
            );

            offset++;
          }

          var row = Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          );
          rows.add(row);
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(6, 4, 6, 16),
          child: Column(children: rows),
        );
      },
    );
  }
}
