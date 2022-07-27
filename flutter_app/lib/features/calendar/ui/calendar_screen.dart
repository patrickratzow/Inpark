import "package:flutter/material.dart";
import "package:flutter_app/features/calendar/ui/calendar_events.dart";
import "package:intl/intl.dart";
import "package:table_calendar/table_calendar.dart";
import "../../../common/colors.dart";
import "../../../common/screen.dart";
import "../../../common/ui/screen_app_bar.dart";
import "../../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../models/calendar_event.dart";
import "../models/calendar_model.dart";

class CalendarScreen extends HookWidget implements Screen {
  const CalendarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = useProvider<CalendarModel>(watch: true);
    final theme = useTheme();
    final pageController = useState<PageController?>(null);
    final isLoading = model.isLoading;

    return Scaffold(
      appBar: const ScreenAppBar(
        title: "Kalender",
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: const Color(0xffeef2ee),
                    child: Column(
                      children: [
                        if (pageController.value != null)
                          _buildHeaderRow(pageController.value!, model, theme),
                        TableCalendar<CalendarEvent>(
                          locale: "da",
                          onCalendarCreated: (controller) => Future.microtask(
                            () => pageController.value = controller,
                          ),
                          calendarBuilders: CalendarBuilders(
                            singleMarkerBuilder: (context, day, event) {
                              if (event.color == null) return Container();
                              //if (event.open == false) return Container();

                              return Icon(
                                Icons.circle,
                                size: 8,
                                color: event.color,
                              );
                            },
                            dowBuilder: (context, day) {
                              final text = DateFormat.E("da").format(day);

                              return Center(
                                child: Text(
                                  text,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              );
                            },
                          ),
                          onPageChanged: (focusedDay) =>
                              model.selectedDay = focusedDay,
                          calendarStyle: CalendarStyle(
                            outsideDaysVisible: false,
                            selectedDecoration: const BoxDecoration(
                              color: Color.fromARGB(255, 214, 216, 214),
                              shape: BoxShape.circle,
                            ),
                            selectedTextStyle: TextStyle(
                              color: CustomColor.green.middle,
                              fontSize: 14,
                            ),
                            isTodayHighlighted: false,
                          ),
                          selectedDayPredicate: (day) {
                            return isSameDay(model.selectedDay, day);
                          },
                          onDaySelected: (selectedDay, _) {
                            model.selectedDay = selectedDay;
                          },
                          eventLoader: (date) {
                            final result = model.getCalendarEventsForDay(date);
                            if (result.isError) return [];

                            return result.success!;
                          },
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          headerVisible: false,
                          firstDay: DateTime(2021, 8, 1),
                          focusedDay: model.selectedDay,
                          lastDay: DateTime(2022, 12, 30),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const CalendarEvents(),
                ],
              ),
            ),
    );
  }

  Widget _buildHeaderRow(
    PageController pageController,
    CalendarModel model,
    ThemeData theme,
  ) {
    const double height = 48;
    const double width = 48;
    const double iconSize = 18;
    const iconConstraints = BoxConstraints(
      minHeight: height,
      maxHeight: height,
      minWidth: width,
      maxWidth: width,
    );
    final monthName =
        DateFormat("MMMM yyyy", "da-dk").format(model.selectedDay);
    final monthNameUppercase =
        monthName.substring(0, 1).toUpperCase() + monthName.substring(1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
          child: Text(
            monthNameUppercase,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
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
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
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
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
