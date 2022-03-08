import 'package:covid_go_cek_in/view/pindai_screen/pindai_container.dart';
import 'package:flutter/material.dart';
import '../akun_screen/akun_container.dart';
import '../home_screen/home_container.dart';
import '../pindai_screen/pindai_container.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class HomeScreenPage extends StatefulWidget {
  @override
  HomeScreenPageState createState() => new HomeScreenPageState();
}

class HomeScreenPageState extends State<HomeScreenPage> {
  int currentIndex = 1;
  final List<Widget> viewContainer = [
    PindaiContainer(),
    HomeContainer(),
    AkunContainer()
  ];

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to exit'),
        ),
        child: viewContainer[currentIndex],
      ),
      bottomNavigationBar: new BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: currentIndex,
          fixedColor: Colors.green,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.qr_code),
              label: "Pindai",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              label: "Akun",
            )
          ]),
    );
  }
}
