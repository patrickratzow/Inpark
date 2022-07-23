import "package:shared_preferences/shared_preferences.dart";

class NotificationService {
  Future<bool> shouldNotifyShortlyBeforeStart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool shouldSend =
        prefs.getBool("speak_notification_notify_shortly_before_start") ??
            false;

    return shouldSend;
  }

  Future setShouldNotifyShortlyBeforeStart(bool shouldSend) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("speak_notification_notify_shortly_before_start", shouldSend);
  }

  Future<Duration> getReminderTime() async {
    const defaultDuration = 15 * 60;
    final prefs = await SharedPreferences.getInstance();
    final duration = prefs.getInt("speak_notification_reminder_time");

    return Duration(seconds: duration ?? defaultDuration);
  }

  Future setReminderTime(Duration duration) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("speak_notification_reminder_time", duration.inSeconds);
  }

  Future<bool> hasSetReminderTime() async {
    final prefs = await SharedPreferences.getInstance();
    final duration = prefs.getInt("speak_notification_reminder_time");

    return duration != null;
  }
}
