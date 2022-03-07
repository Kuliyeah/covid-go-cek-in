import 'package:flutter/material.dart';
import 'package:go_cek_in/view/home_screen/home_container.dart';
import 'package:go_cek_in/view/home_screen/home_page.dart';
import 'package:go_cek_in/view/splash_screen/splash_screen_page.dart';
import 'package:go_cek_in/view/akun_screen/akun_container.dart';
import 'package:go_cek_in/Constant/constant.dart';
import 'view/pindai_screen/pindai_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GoCheck-in",
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Lato'),
      home: SplashScreenPage(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => new HomeScreenPage(),
        ANIMATED_SPLASH: (BuildContext context) => new SplashScreenPage(),
        PHOTO_CONTAINER_SCREEN: (BuildContext context) => new PindaiContainer(),
        VIDEO_CONTAINER_SCREEN: (BuildContext context) => new HomeContainer(),
        ALBUM_CONTAINER_SCREEN: (BuildContext context) => new AkunContainer()
      },
    );
  }
}
