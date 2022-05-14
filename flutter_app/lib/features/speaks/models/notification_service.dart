import "package:flutter_app/hooks/hooks.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:timezone/data/latest.dart" as tz;
import "package:timezone/timezone.dart" as tz;

class NotificationService {
  //NotificationService a singleton object
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    tz.initializeTimeZones();
    return _notificationService;
  }

  NotificationService._internal();

  static const channelId = "zooinator_notification";

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    InitializationSettings initializationSettings = _initializeSettings();

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification,
    );
  }

  InitializationSettings _initializeSettings() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@drawable/ic_stat_alarm_on");

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: null,
    );

    return initializationSettings;
  }

  Future<bool> showNotification(
    int id,
    String title,
    String body,
    int seconds,
  ) async {
    var response = await _requestPermissions();

    if (!response) return false;

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
      _platformNotificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );

    return true;
  }

  NotificationDetails _platformNotificationDetails() {
    AndroidNotificationDetails _androidNotificationDetails =
        const AndroidNotificationDetails(
      "main_channel",
      "Main Channel",
      playSound: true,
      importance: Importance.max,
      priority: Priority.max,
      icon: "@drawable/ic_stat_alarm_on",
    );

    IOSNotificationDetails _iOSNotificationDetails =
        const IOSNotificationDetails(
      sound: "default.wav",
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    return NotificationDetails(
      android: _androidNotificationDetails,
      iOS: _iOSNotificationDetails,
    );
  }

  Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<bool> _requestPermissions() async {
    final capabilities = useCapabilities();
    if (!capabilities.shouldRequestPermissionsForNotifications) return true;

    final bool? result = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    return result ?? false;
  }
}

Future selectNotification(String? payload) async {
  //handle your logic here
}
