import 'package:covid_go_cek_in/view/login_screen/login_page.dart';
import 'package:flutter/material.dart';
import 'view/screen/main_screen.dart';
import 'view/splash_screen/splash_screen_page.dart';
import 'constant/constant.dart';
import 'view/screen/scan_screen/scan_page.dart';

void main() {
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
      home: const LoginPage(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => const MainScreen(),
        ANIMATED_SPLASH: (BuildContext context) => const SplashScreenPage(),
        PHOTO_CONTAINER_SCREEN: (BuildContext context) => const ScanPage(),
        VIDEO_CONTAINER_SCREEN: (BuildContext context) => const MainScreen(),
      },
    );
  }
}
