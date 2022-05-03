import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_app/common/ui/home_app_bar.dart';
import 'package:flutter_app/common/ui/screen_app_bar.dart';
import 'package:flutter_app/common/ui/title_bar.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends HookWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = useState(CalendarDate(2022, 10, 1));

    return Scaffold(
      appBar: const ScreenAppBar(
        title: "Kalendar",
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xffeef2ee),
            child: Column(
              children: [
                _buildHeaderRow(date),
                _buildDaysRow(date),
                _buildDates(date),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(ValueNotifier<CalendarDate> date) {
    const double height = 48;
    const double width = 24;
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
          padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: Text(
            date.value.monthName,
            style: TextStyle(
              fontSize: 20,
              height: 1,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              color: Color(0xff0A0A0A),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              IconButton(
                constraints: iconConstraints,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: iconSize,
                ),
                onPressed: () {},
              ),
              IconButton(
                constraints: iconConstraints,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: iconSize,
                ),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDaysRow(ValueNotifier<CalendarDate> date) {
    final days = date.value.weekdays;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days
            .map(
              (day) => Text(
                day,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff979997),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildDates(ValueNotifier<CalendarDate> date) {
    var days = date.value.daysInMonth;
    var amountOfRows = (days / 7).ceil();
    var rows = <Row>[];
    for (var i = 0; i < amountOfRows; i++) {
      var row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var j = 0; j < 7; j++)
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  (1 + ((i + 1) * j)).toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff0A0A0A),
                  ),
                ),
              ),
            ),
        ],
      );
      rows.add(row);
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      child: Column(children: rows),
    );
  }
}

class CalendarBody extends StatelessWidget {
  const CalendarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CalendarDate {
  int year;
  int month;
  int day;

  CalendarDate(this.year, this.month, this.day);

  DateTime get date => DateTime(year, month, day);
  int get daysInMonth => difference(1).inDays;
  int get daysInPreviousMonth => difference(-1).inDays;

  Duration difference(int months) {
    assert(months != 0);

    DateTime next;
    if (months > 0) {
      // If the month is december go to next year
      next = month == DateTime.december
          ? DateTime(year + 1, 1)
          : DateTime(year, month + 1);
    } else {
      next = month == DateTime.january
          ? DateTime(year - 1, 12)
          : DateTime(year, month - 1);
    }

    return next.toUtc().difference(date);
  }

  DateFormat _formatter(String format) => DateFormat(format);

  String get monthName => _formatter("MMMM yyyy").format(date).toString();

  List<String> get weekdays {
    List<String> days = [];

    var date = DateTime(2022, 05, 02);
    for (var i = 0; i < 7; i++) {
      var abbreviation =
          _formatter(DateFormat.ABBR_WEEKDAY).format(date).toString();
      days.add(abbreviation);

      date = date.add(const Duration(days: 1));
    }

    return days;
  }

  // Check if an offset based on UI rows for calendar is inside the current month
  // Outside elements will be considered part of last or next month
  // Base it off weekday, so that if previous month's 31st is a Tuesday, and 1st for the current month is 1st, an offset of 0 would not be current month
  bool isInsideMonth(int offset) {
    var date = DateTime(year, month, 1);
    var weekday = date.weekday;
    var offsetWeekday = (weekday + offset) % 7;
    var offsetDay = (offsetWeekday + 1) % 7;

    return offsetDay != 0;
  }
}
