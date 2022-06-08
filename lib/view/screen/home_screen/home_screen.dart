import 'package:flutter/material.dart';

import 'package:covid_go_cek_in/view/login_screen/login_page.dart';
import 'package:covid_go_cek_in/view/screen/main_screen.dart';
import 'package:covid_go_cek_in/view/screen/home_screen/kasus_container.dart';
import '../../../constant/constant.dart';
import 'package:covid_go_cek_in/view/screen/home_screen/berita_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreenColor,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
    );
  }
}

Widget alreadyCheckin(BuildContext context) {
  if (checkInData.getBool('checkIn') == true) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Status Check-in",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: textColor,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          checkInData.getString('namaMitra').toString(),
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 5),
        Text(
          checkInData.getString('alamatMitra').toString(),
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 10),
        FractionallySizedBox(
          widthFactor: 1,
          // ignore: deprecated_member_use
          child: RaisedButton(
            child: const Text(
              "Check-out",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            color: Colors.red,
            textColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            onPressed: () {
              checkInData.setBool('checkIn', false);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Berhasil Check-out"),
                  duration: Duration(milliseconds: 1000),
                ),
              );

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const MainScreen(),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
  return const SizedBox.shrink();
}

Widget _buildContent(BuildContext context) {
  return Container(
    color: mainColor,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Container(
            constraints: const BoxConstraints(maxHeight: 300, maxWidth: 1000),
            child: Image.asset('assets/img/header_home.png'),
          ),
          Container(
            decoration: BoxDecoration(
              color: lighterGreenColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 10),
                  alreadyCheckin(context),
                  Text(
                    "Kasus",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: textColor),
                  ),
                  const SizedBox(height: 10),
                  const KasusContainer(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Berita",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: textColor),
                  ),
                  const BeritaList(),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}