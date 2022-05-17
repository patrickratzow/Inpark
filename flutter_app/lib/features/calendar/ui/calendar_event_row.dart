import "package:flutter/material.dart";
import "../../../common/extensions/theme.dart";
import "../models/calendar_event.dart";
import "../../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class CalendarEventRow extends HookWidget {
  final CalendarEvent event;

  const CalendarEventRow({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();
    final titleColor = theme.adjustColor(
      light: const Color(0xff666666),
      dark: const Color(0xffcccccc),
    );
    final bodyColor = theme.adjustColor(
      light: const Color(0xff333333),
      dark: const Color(0xffaaaaaa),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          event.title,
          textAlign: TextAlign.left,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          event.body,
          textAlign: TextAlign.left,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: bodyColor,
          ),
        ),
      ],
    );
  }
}
