import 'dart:convert';

import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:covid_go_cek_in/helperurl.dart';
import 'package:covid_go_cek_in/view/login_screen/login_page.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'history_screen/history_page.dart';
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
  String? _data;
  final List<Widget> viewContainer = [
    const HistoryPage(),
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
        child: const Icon(Icons.camera_alt),
        onPressed: () async {
          await FlutterBarcodeScanner.scanBarcode(
                  "#000000", "Cancel", true, ScanMode.DEFAULT)
              .then(
            (value) => setState(() => _data = value),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Selamat datang " + _data.toString()),
              duration: const Duration(milliseconds: 1000),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: currentIndex,
        fixedColor: mainColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
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
