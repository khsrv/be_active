import 'dart:async';
import 'dart:developer';

import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/providers/home_provider.dart';
import 'package:be_active/screens/error_screen.dart';
import 'package:be_active/screens/home_screen.dart';
import 'package:be_active/service/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Future.delayed(const Duration(seconds: 2));
      await initialSettings();

      runApp(const MyApp());
    },
    (error, stackTrace) {},
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        supportedLocales: const [
          Locale('ru', 'RU'), // English
        ],
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        // home: appRun() ? const HomeScreen() : const ErrorScreen(),
      ),
    );
  }
}

bool appRun() {
  DateTime now = DateTime.now();
  DateTime endTime = DateTime(2023, 2, 11);
  var day = endTime.difference(now).inDays;
  log("day ${day}");
  return day > 0;
}

Future<void> initialSettings() async {
  NotificationService().initNotification();

  tz.initializeTimeZones();
  log("DateTime ${DateTime.now().hour}");

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}
