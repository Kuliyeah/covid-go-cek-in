import 'dart:convert';

import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:covid_go_cek_in/helperurl.dart';
import 'package:covid_go_cek_in/view/login_screen/login_page.dart';
import 'history_screen/history_page.dart';
import 'scan_screen/scan_page.dart';
import 'package:flutter/material.dart';
import 'account_screen/akun_container.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'home_screen/home_screen.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

late dynamic decodedData;

class MainScreenState extends State<MainScreen> {
  int currentIndex = 1;
  final List<Widget> viewContainer = [
    const ScanPage(),
    const HomePage(),
    const AkunContainer()
  ];

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    String url = MyUrl().getUrl();
    var response = await http.get("$url/v1/pengunjung/login/" +
        logindata.getString('username').toString());
    decodedData = jsonDecode(response.body);
  }

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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.history),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HistoryPage()));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: currentIndex,
        fixedColor: mainColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: "Pindai",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Akun",
          )
        ],
      ),
    );
  }
}
