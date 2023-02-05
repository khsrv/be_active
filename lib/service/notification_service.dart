import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  NotificationService._internal();
  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      '@drawable/icon',
    );
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(
      int id, String title, String body, String payload) async {
    log("show notification showNotification");
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: 'Main channel notifications',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true,
            sound: RawResourceAndroidNotificationSound('sound'),
            icon: '@drawable/icon'),
        iOS: IOSNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }

  Future<void> showScheduleNotifications(int id, String title, String body,
      String payload, Duration duration) async {
    var createTime =
        Time(duration.inHours, duration.inMinutes % 60, 0); //at 3.30
    flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body.isNotEmpty ? body : 'Без названия',
        tz.TZDateTime.from(
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, createTime.hour, createTime.minute),
            tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails('main_channel', 'Main Channel',
              channelDescription: 'Main channel notifications',
              importance: Importance.max,
              priority: Priority.max,
              playSound: true,
              sound: RawResourceAndroidNotificationSound('sound'),
              icon: '@drawable/icon'),
          iOS: IOSNotificationDetails(
            sound: 'default.wav',
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> showPeriodicly(int id, String title, String body, String payload,
      Duration duration) async {
    var time = Time(duration.inHours, duration.inMinutes % 60, 0); //at 3.30
    log("time ${time.hour}");
    log("time ${time.minute}");

    await flutterLocalNotificationsPlugin.showDailyAtTime(
      id,
      title,
      body,
      time,
      const NotificationDetails(
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: 'Main channel notifications',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true,
            sound: RawResourceAndroidNotificationSound('sound'),
            icon: '@drawable/icon'),
        iOS: IOSNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }

  Future<void> cancelNotificationLocal(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
