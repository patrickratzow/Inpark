import "package:flutter/material.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import "package:provider/provider.dart";

import '../models/calendar_model.dart';
import 'calendar_events.dart';
import 'calendar_month.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScreenAppBar(
        title: "Kalender",
      ),
      body: Consumer<CalendarModel>(
        builder: (context, date, child) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xffeef2ee),
                child: Column(
                  children: [
                    _buildHeaderRow(date),
                    GestureDetector(
                      onHorizontalDragEnd: (DragEndDetails details) {
                        if (details.primaryVelocity == null) return;

                        if (details.primaryVelocity! > 0) {
                          // User swiped Left

                          date.previousMonth();
                        } else if (details.primaryVelocity! < 0) {
                          // User swiped Right

                          date.nextMonth();
                        }
                      },
                      child: Column(
                        children: [
                          _buildDaysRow(date),
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
      ),
    );
  }

  Widget _buildHeaderRow(CalendarModel date) {
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
            style: const TextStyle(
              fontSize: 20,
              height: 1,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              color: Color(0xff0A0A0A),
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

  Widget _buildDaysRow(CalendarModel date) {
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
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff979997),
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
