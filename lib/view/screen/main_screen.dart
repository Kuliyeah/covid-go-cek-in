// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:covid_go_cek_in/helperurl.dart';
import 'package:covid_go_cek_in/view/login_screen/login_page.dart';
import 'package:covid_go_cek_in/view/screen/scan_screen/scan_page.dart';
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
  late String data, rawData;
  final List<Widget> viewContainer = [
    const HistoryPage(),
    const HomePage(),
    // const MyNotification(),
    const AkunContainer(),
  ];

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    String url = MyUrl().getUrl();
    var response = await http.get(Uri.parse("$url/v1/pengunjung/login/" +
        logindata.getString('username').toString()));
    decodedData = jsonDecode(response.body);
  }

  Widget showCheckInButton() {
    if (checkInData.getBool('checkIn') == false) {
      return FloatingActionButton(
        child: const Icon(Icons.camera_alt),
        onPressed: () async {
          await FlutterBarcodeScanner.scanBarcode(
                  "#000000", "Cancel", true, ScanMode.DEFAULT)
              .then(
            (value) => setState(() {
              rawData = value;
              data = getIDMitraFromScanner(value);
            }),
          );
          if (validationData(rawData) == false) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Bukan QR Code GoCekIn. Gagal Check-in"),
                duration: Duration(milliseconds: 3000),
              ),
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
            );
          } else {
            checkIn(data);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Check-in berhasil"),
                duration: Duration(milliseconds: 3000),
              ),
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
            );
          }
        },
      );
    }
    return const SizedBox.shrink();
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
      floatingActionButton: showCheckInButton(),
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.notifications),
          //   label: "Notification",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Akun",
          ),
        ],
      ),
    );
  }
}
