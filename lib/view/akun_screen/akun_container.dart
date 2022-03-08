import 'package:flutter/material.dart';
import 'akun_setting.dart';
import '../history_screen/history_page.dart';

class AkunContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
    );
  }
}

Widget _buildContent(BuildContext context) {
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Container(
            color: Color.fromARGB(255, 66, 192, 105),
            child: Padding(
              padding: EdgeInsets.only(top: 50, left: 20, bottom: 20),
              child: Row(children: <Widget>[
                Image.asset('assets/img/avatar/avatar_7.png', scale: 1.5),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Lovanto R.",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("RifkyLovanto@gmail.com",
                            style: TextStyle(
                                fontSize: 15.5,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          GestureDetector(
            child: Row(
              children: <Widget>[
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
                      builder: (BuildContext context) => HistoryPage()));
            },
          ),
          Divider(color: Colors.black45),
          GestureDetector(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: Color.fromARGB(255, 41, 52, 61),
                    size: 35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text(
                    "Pengaturan Akun",
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 41, 52, 61)),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AkunSetting()));
            },
          ),
          Divider(color: Colors.black45),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Icon(
                  Icons.settings_outlined,
                  color: Color.fromARGB(255, 41, 52, 61),
                  size: 35,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Text(
                  "Pengaturan Aplikasi",
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 41, 52, 61)),
                ),
              ),
            ],
          ),
          Divider(color: Colors.black45),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Icon(
                  Icons.article_outlined,
                  color: Color.fromARGB(255, 41, 52, 61),
                  size: 35,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Text(
                  "Log Pengembangan",
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 41, 52, 61)),
                ),
              ),
            ],
          ),
          Divider(color: Colors.black45),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Icon(
                  Icons.copyright_outlined,
                  color: Color.fromARGB(255, 41, 52, 61),
                  size: 35,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Text(
                  "Lisensi Open Source",
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 41, 52, 61)),
                ),
              ),
            ],
          ),
          Divider(color: Colors.black45),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Icon(
                  Icons.wysiwyg_outlined,
                  color: Color.fromARGB(255, 41, 52, 61),
                  size: 35,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Text(
                  "Terms of Service",
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 41, 52, 61)),
                ),
              ),
            ],
          ),
          Divider(color: Colors.black45),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Icon(
                  Icons.help_outline,
                  color: Color.fromARGB(255, 41, 52, 61),
                  size: 35,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Text(
                  "Bantuan",
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 41, 52, 61)),
                ),
              ),
            ],
          ),
          Divider(color: Colors.black45),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Icon(
                  Icons.login_outlined,
                  color: Color.fromARGB(255, 41, 52, 61),
                  size: 35,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
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
        ],
      ));
}
