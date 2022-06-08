// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:covid_go_cek_in/helperurl.dart';
import 'package:covid_go_cek_in/view/screen/main_screen.dart';
import 'package:covid_go_cek_in/view/login_screen/login_page.dart';
import 'package:crypto/crypto.dart';
import 'menu_screen/log_page.dart';
import 'term_of_service_screen/term_of_service_page.dart';
import 'package:flutter/material.dart';
import 'bantuan_screen/bantuan_page.dart';
import '../history_screen/history_page.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class AkunSetting extends StatelessWidget {
  const AkunSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lighterGreenColor,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Pengaturan",
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _goBack(context);
          },
        ),
      ),
    );
  }
}

_goBack(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => const MainScreen(),
    ),
  );
}

final passwordController = TextEditingController();
Widget _buildContent(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: SafeArea(
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Icon(
                    Icons.history_outlined,
                    color: Color.fromARGB(255, 41, 52, 61),
                    size: 35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Text(
                    "Riwayat Check-in",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 41, 52, 61),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const HistoryPage(),
                ),
              );
            },
          ),
          const Divider(color: Colors.black45),
          GestureDetector(
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Icon(
                    Icons.article_outlined,
                    color: Color.fromARGB(255, 41, 52, 61),
                    size: 35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Text(
                    "Log Pengembangan",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 41, 52, 61),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const LogPage(),
                ),
              );
            },
          ),
          const Divider(color: Colors.black45),
          GestureDetector(
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Icon(
                    Icons.wysiwyg_outlined,
                    color: Color.fromARGB(255, 41, 52, 61),
                    size: 35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Text(
                    "Terms of Service",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 41, 52, 61),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const Term_Of_Service_Page(),
                ),
              );
            },
          ),
          const Divider(color: Colors.black45),
          GestureDetector(
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Icon(
                    Icons.help_outline,
                    color: Color.fromARGB(255, 41, 52, 61),
                    size: 35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Text(
                    "Bantuan",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 41, 52, 61),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Bantuan_page(),
                ),
              );
            },
          ),
          const Divider(color: Colors.black45),
          GestureDetector(
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Icon(
                    Icons.key_sharp,
                    color: Color.fromARGB(255, 41, 52, 61),
                    size: 35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Text(
                    "Change Password",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 41, 52, 61),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Change Password'),
                  content: Container(
                    height: 50,
                    child: Column(
                      children: [
                        TextField(
                          controller: passwordController,
                          autofocus: true,
                          decoration:
                              const InputDecoration(hintText: 'New Password'),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        updateData("passwordPengunjung", "editpassword");
                        Navigator.of(context).pop();
                      },
                      child: const Text("SUBMIT"),
                    )
                  ],
                ),
              );
            },
          ),
          const Divider(color: Colors.black45),
          GestureDetector(
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Icon(
                    Icons.login_outlined,
                    color: Color.fromARGB(255, 41, 52, 61),
                    size: 35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 41, 52, 61),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              logindata.clear();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const LoginPage(),
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Berhasil logout"),
                  duration: Duration(milliseconds: 1000),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

Future updateData(String field, String data) async {
  String url = MyUrl().getUrl();
  String urlPengunjung =
      "$url/v1/pengunjung/$data/" + logindata.getString('username').toString();
  await http.put(
    Uri.parse(urlPengunjung),
    body: {field: md5.convert(utf8.encode(passwordController.text)).toString()},
  );
}
