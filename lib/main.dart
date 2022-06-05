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

AndroidNotificationChannel? channel;
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
PushNotification push = PushNotification();

Future<void> messageHandlerForeground() async {
  await Firebase.initializeApp();
  print('Handler on Foreground Message');
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    PushNotification.showNotification(message);
    print("Message: ${message.messageId}");
    print("Message-title: ${message.notification}");
    print("Message: ${message.data}");
  });
}

Future<void> messageHandlerBackground(RemoteMessage message) async {
  await Firebase.initializeApp();
  PushNotification.showNotification(message);
  print('Handler on Background Message');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  messageHandlerForeground();
  FirebaseMessaging.onBackgroundMessage(messageHandlerBackground);
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
      home: const MyHomeApp(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => const MainScreen(),
        ANIMATED_SPLASH: (BuildContext context) => const SplashScreenPage(),
        VIDEO_CONTAINER_SCREEN: (BuildContext context) => const MainScreen(),
      },
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  @override
  void initState() {
    super.initState();
    messageHandlerForeground();
    FirebaseMessaging.onBackgroundMessage(messageHandlerBackground);

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(milliseconds: 10);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreenPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
