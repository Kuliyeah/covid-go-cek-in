import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:covid_go_cek_in/view/home_screen/home_page.dart';
import 'package:flutter/material.dart';
import '../history_screen/history_page.dart';

class AkunSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lighterGreenColor,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Pengaturan",
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _goBack(context);
          },
        ),
      ),
    );
  }
}

_goBack(BuildContext context) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) => HomeScreenPage()));
}

Widget _buildContent(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: SafeArea(
      child: Column(
        children: <Widget>[
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
      ),
    ),
  );
}
