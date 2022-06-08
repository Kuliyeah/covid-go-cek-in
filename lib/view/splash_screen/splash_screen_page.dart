// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api

import 'dart:async';

import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:covid_go_cek_in/view/screen/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';
import '../login_screen/login_page.dart';
import 'package:covid_go_cek_in/service/push_notification.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  final String _versionName = 'Versi 1.0.0';
  final splashDelay = 5;

  @override
  void initState() {
    super.initState();
    setState(() {
      PushNotification.messageHandlerForeground(context);
      PushNotification.messageHandlerTerminated(context);
      PushNotification.openedMessage(context);
    });

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MESSAGE_VIEW: (BuildContext context) => const MessageView(),
      },
      home: Scaffold(
        backgroundColor: splashBgColor,
        body: InkWell(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/img/icon.png',
                          scale: 1.5,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              _versionName,
                              style: TextStyle(color: mainColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
