import 'package:flutter/material.dart';
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:timezone/data/latest.dart" as tz;
import "package:timezone/timezone.dart" as tz;

import '../../../generated_code/zooinator.models.swagger.dart';

class NotificationService {
  //NotificationService a singleton object
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    tz.initializeTimeZones();
    return _notificationService;
  }

  NotificationService._internal();

  static const channelId = "zooinator_notifications";

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("@drawable/ic_stat_alarm_on");

    final IOSInitializationSettings initializationSettingsIOS =
        const IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: null);

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  final AndroidNotificationDetails _androidNotificationDetails =
      const AndroidNotificationDetails(
    "channel ID",
    "channel name",
    channelDescription: "Channel description",
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  Future<void> showNotification(
    int id,
    String title,
    String body,
    int seconds,
  ) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
      const NotificationDetails(
        android: AndroidNotificationDetails("main_channel", "Main Channel",
            importance: Importance.max,
            priority: Priority.max,
            icon: "@drawable/ic_stat_alarm_on"),
        iOS: IOSNotificationDetails(
          sound: "default.wav",
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> scheduleNotifications() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        "Notification Title",
        "This is the Notification Body!",
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        NotificationDetails(android: _androidNotificationDetails),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

void compareTime(DateTime startTime) {}

Future selectNotification(String? payload) async {
  //handle your logic here
}
