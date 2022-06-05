import 'package:covid_go_cek_in/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotification {
  late bool cekLogin;

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
}
