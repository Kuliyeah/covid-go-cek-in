// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'package:covid_go_cek_in/main.dart';
import 'package:covid_go_cek_in/view/screen/notification_screen/notification_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:covid_go_cek_in/constant/constant.dart';

class PushNotification {
  static Future<void> showNotification(RemoteMessage event) async {
    var android = const AndroidInitializationSettings('launch_background');
    var initSettingIoS = const IOSInitializationSettings();
    var initSetting =
        InitializationSettings(android: android, iOS: initSettingIoS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin?.initialize(initSetting);

    const AndroidNotificationDetails notifDetail = AndroidNotificationDetails(
        'default_notification_channel_id', 'Notification',
        importance: Importance.max,
        priority: Priority.high,
        icon: 'launch_background',
        playSound: true);
    const iOSdetails = IOSNotificationDetails();
    const NotificationDetails _notifDetai =
        NotificationDetails(android: notifDetail, iOS: iOSdetails);

    await flutterLocalNotificationsPlugin?.show(
        0, event.notification!.title, event.notification!.body, _notifDetai);
  }

  static Future<void> requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  //fungsi untuk memanggil saat foreground
  static Future<void> messageHandlerForeground(BuildContext context) async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((message) {
      showNotification(message);

      if (message.notification != null) {
        print("Message: ${message.notification!.title}");
        Navigator.pushNamed(
          context,
          MESSAGE_VIEW,
          arguments: MessageCacther(message, true),
        );
      } else {
        print("tidak ada message");
      }
    });
  }

  //untuk memanggil saat terminated
  static Future<void> messageHandlerTerminated(BuildContext context) async {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message!.notification != null) {
        Navigator.pushNamed(
          context,
          MESSAGE_VIEW,
          arguments: MessageCacther(message, true),
        );
        print(message.notification!.title);
      }
    });
  }

  static Future<void> openedMessage(BuildContext context) async {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.notification != null) {
        Navigator.pushNamed(
          context,
          MESSAGE_VIEW,
          arguments: MessageCacther(message, true),
        );
      }
    });
  }

  static Future navigateToNotificationPage(BuildContext context) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MessageView(),
      ),
    );
  }
}
