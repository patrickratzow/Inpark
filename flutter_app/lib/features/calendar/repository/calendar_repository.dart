import "../../../common/ioc.dart";
import "../../../generated_code/zooinator.swagger.dart";

import "../models/calendar_event.dart";

class CalendarRepository {
  List<CalendarEvent>? _events;

  Future<List<CalendarEvent>> fetchEvents() async {
    var openingHours = await _fetchOpeningHours();

    return _events ?? [...openingHours];
  }

  Future<List<OpeningHourCalendarEvent>> _fetchOpeningHours() async {
    var apiClient = locator.get<Zooinator>();

    try {
      var response = await apiClient.getOpeningHours();
      if (!response.isSuccessful) {
        return Future.error(response.error.toString());
      }

      var events = response.body!;
      return events
          .map((x) => OpeningHourCalendarEvent(x.start, x.end, x.open))
          .toList();
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }
}
