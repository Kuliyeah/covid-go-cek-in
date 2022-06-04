import 'package:covid_go_cek_in/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotification {
  late bool cekLogin;

  static Future<void> showNotification(RemoteMessage event) async {
    var android = const AndroidInitializationSettings('launch_background');
    var initSettingIoS = const IOSInitializationSettings();
    var initSetting =
        new InitializationSettings(android: android, iOS: initSettingIoS);
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
  // Future<void> authorize(RemoteMessage message, AndroidNotificationChannel? channel,
  //     FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin) async {

  //   if (Platform.isIOS) {
  //     FirebaseMessaging messaging = FirebaseMessaging.instance;

  //     NotificationSettings settings = await messaging.requestPermission(
  //       alert: true,
  //       announcement: false,
  //       badge: true,
  //       carPlay: false,
  //       criticalAlert: false,
  //       provisional: false,
  //       sound: true,
  //     );
  //     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //       print('User granted permission: ${settings.authorizationStatus}');
  //     } else {
  //       print('user declined or not accepted');
  //     }
  //   }
  //   if (!kIsWeb) {
  //     channel = const AndroidNotificationChannel(
  //       'high_importance_channel', // id
  //       'High Importance Notifications', // title

  //       importance: Importance.max,
  //     );

  //     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //     await flutterLocalNotificationsPlugin
  //         .resolvePlatformSpecificImplementation<
  //             AndroidFlutterLocalNotificationsPlugin>()
  //         ?.createNotificationChannel(channel);
  //     await FirebaseMessaging.instance
  //         .setForegroundNotificationPresentationOptions(
  //       alert: true,
  //       badge: true,
  //       sound: true,
  //     );
  //   }

  // }

  // void listenMessage(AndroidNotificationChannel? channel,
  //     FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin) {
  //   FirebaseMessaging.onMessage.listen((message) {
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification != null && android != null && !kIsWeb) {
  //       flutterLocalNotificationsPlugin?.show(
  //         notification.hashCode,
  //         notification.title,
  //         notification.body,
  //         NotificationDetails(
  //           android: AndroidNotificationDetails(
  //             channel!.id,
  //             channel.name,
  //             icon: 'launch_background',
  //           ),
  //         ),
  //       );
  //     }
  // });
  // }
}
