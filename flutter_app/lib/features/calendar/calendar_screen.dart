import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_app/common/ui/home_app_bar.dart';
import 'package:flutter_app/common/ui/screen_app_bar.dart';
import 'package:flutter_app/common/ui/title_bar.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/date_symbols.dart';

class CalendarScreen extends HookWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                _buildHeaderRow(),
                _buildDaysRow(),
                _buildDates(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
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
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: Text(
            "Oktober 2022",
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

  Widget _buildDaysRow() {
    final days = ["Man", "Tir", "Ons", "Tor", "Fre", "Lør", "Søn"];

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

  Widget _buildDates() {
    var date = CalendarDate(2022, 10, 1);
    var days = date.daysInMonth;
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
                  date.day.toString(),
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

class CalendarDate {
  int year;
  int month;
  int day;

  CalendarDate(this.year, this.month, this.day);

  int get daysInMonth => difference(1).inDays;
  int get daysInPreviousMonth => difference(-1).inDays;

  Duration difference(int months) {
    assert(months != 0);

    var current = DateTime(year, month);
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

    return next.toUtc().difference(current);
  }
}
