import "package:flutter/material.dart";
import "../../../common/screen.dart";
import "../../../common/ui/screen_app_bar.dart";
import "../../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../models/calendar_model.dart";
import "calendar_events.dart";
import "calendar_month.dart";

class CalendarScreen extends HookWidget implements Screen {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = useProvider<CalendarModel>(watch: true);
    final theme = useTheme();

    return Scaffold(
      appBar: const ScreenAppBar(
        title: "Kalender",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xffeef2ee),
              child: Column(
                children: [
                  _buildHeaderRow(model, theme),
                  GestureDetector(
                    onHorizontalDragEnd: (DragEndDetails details) {
                      if (details.primaryVelocity == null) return;

                      if (details.primaryVelocity! > 0) {
                        // User swiped Left

                        model.previousMonth();
                      } else if (details.primaryVelocity! < 0) {
                        // User swiped Right

                        model.nextMonth();
                      }
                    },
                    child: Column(
                      children: [
                        _buildDaysRow(model, theme),
                        const CalendarMonth(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const CalendarEvents(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow(CalendarModel date, ThemeData theme) {
    const double height = 48;
    const double width = 48;
    const double iconSize = 18;
    const iconConstraints = BoxConstraints(
      minHeight: height,
      maxHeight: height,
      minWidth: width,
      maxWidth: width,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 0, 12),
          child: Text(
            date.monthName,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Row(
            children: [
              ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    constraints: iconConstraints,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: iconSize,
                    ),
                    onPressed: () {
                      date.previousMonth();
                    },
                  ),
                ),
              ),
              ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    constraints: iconConstraints,
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: iconSize,
                    ),
                    onPressed: () {
                      date.nextMonth();
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDaysRow(CalendarModel date, ThemeData theme) {
    final days = date.weekdays;

    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 4, 6, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days
            .map(
              (day) => Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: const Color(0xff979997),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
