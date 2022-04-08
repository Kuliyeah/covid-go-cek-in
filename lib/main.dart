import 'package:flutter/material.dart';
import 'view/screen/main_screen.dart';
import 'view/splash_screen/splash_screen_page.dart';
// import 'view/screen/account_screen/akun_container.dart';
import 'constant/constant.dart';
import 'view/screen/scan_screen/scan_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GoCheck-in",
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Lato'),
      home: MainScreen(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => new MainScreen(),
        ANIMATED_SPLASH: (BuildContext context) => new SplashScreenPage(),
        PHOTO_CONTAINER_SCREEN: (BuildContext context) => new ScanPage(),
        VIDEO_CONTAINER_SCREEN: (BuildContext context) => new MainScreen(),
        // ALBUM_CONTAINER_SCREEN: (BuildContext context) => new AkunContainer()
      },
    );
  }
}
