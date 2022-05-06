import 'package:flutter/material.dart';
import 'package:flutter_app/features/calendar/models/calendar_event.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarEventRow extends StatelessWidget {
  final CalendarEvent event;

  const CalendarEventRow({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          event.title,
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: const Color(0xff666666),
          ),
        ),
        SizedBox(height: 6),
        Text(
          event.body,
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: const Color(0xff333333),
          ),
        ),
      ],
    );
  }
}
