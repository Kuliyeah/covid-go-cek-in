// ignore_for_file: avoid_print

import 'dart:async';

import 'package:covid_go_cek_in/view/screen/notification_screen.dart/notification_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'service/push_notification.dart';
import 'view/screen/main_screen.dart';
import 'view/splash_screen/splash_screen_page.dart';
import 'constant/constant.dart';
import 'service/message.dart';

AndroidNotificationChannel? channel;
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

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

  Future<void> msgOpenedOnApp() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Navigator.pushNamed(context, MESSAGE_CATCH,
          arguments: MessageArguments(message, true));
    });
    navigateToNotif();
  }

  void navigateToNotif() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const MyNotification()));
  }

  _loadWidget() async {
    var _duration = const Duration(milliseconds: 10);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const SplashScreenPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
