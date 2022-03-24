import 'package:flutter/material.dart';
import 'view/home_screen/home_container.dart';
import 'view/home_screen/home_page.dart';
import 'view/splash_screen/splash_screen_page.dart';
import 'view/akun_screen/akun_container.dart';
import 'constant/constant.dart';
// import 'view/pindai_screen/pindai_container.dart';

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
      home: HomeScreenPage(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => new HomeScreenPage(),
        ANIMATED_SPLASH: (BuildContext context) => new SplashScreenPage(),
        // PHOTO_CONTAINER_SCREEN: (BuildContext context) => new PindaiContainer(),
        VIDEO_CONTAINER_SCREEN: (BuildContext context) => new HomeContainer(),
        ALBUM_CONTAINER_SCREEN: (BuildContext context) => new AkunContainer()
      },
    );
  }
}
