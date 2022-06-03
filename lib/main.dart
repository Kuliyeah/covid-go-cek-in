// ignore_for_file: avoid_print

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'service/push_notification.dart';
import 'view/screen/main_screen.dart';
import 'view/splash_screen/splash_screen_page.dart';
import 'constant/constant.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

AndroidNotificationChannel? channel;
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
PushNotification push = PushNotification();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  push.tes(channel, flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

AndroidNotificationChannel? getChannel() {
  return channel;
}

FlutterLocalNotificationsPlugin? getNotif() {
  return flutterLocalNotificationsPlugin;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GoCheck-in",
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Lato'),
      home: const SplashScreenPage(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => const MainScreen(),
        ANIMATED_SPLASH: (BuildContext context) => const SplashScreenPage(),
        VIDEO_CONTAINER_SCREEN: (BuildContext context) => const MainScreen(),
      },
    );
  }
}
