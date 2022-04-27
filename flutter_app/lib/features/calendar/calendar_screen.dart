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
          padding: EdgeInsets.all(16),
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
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
}
