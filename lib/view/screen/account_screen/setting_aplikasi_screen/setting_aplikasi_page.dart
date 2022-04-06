import "package:flutter/material.dart";
import 'package:covid_go_cek_in/constant/constant.dart';

class SettingAplikasiPage extends StatefulWidget {
  SettingAplikasiPage({Key? key}) : super(key: key);

  @override
  State<SettingAplikasiPage> createState() => _SettingAplikasiPageState();
}

class _SettingAplikasiPageState extends State<SettingAplikasiPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lighterGreenColor,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Pengaturan Apikasi",
        ),
      ),
    );
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
                      Icons.settings_outlined,
                      color: Color.fromARGB(255, 41, 52, 61),
                      size: 35,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: Text(
                      "Pengaturan 1",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 41, 52, 61),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black45),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: Icon(
                      Icons.settings_outlined,
                      color: Color.fromARGB(255, 41, 52, 61),
                      size: 35,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: Text(
                      "Pengaturan 2",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 41, 52, 61),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black45),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: Icon(
                      Icons.settings_outlined,
                      color: Color.fromARGB(255, 41, 52, 61),
                      size: 35,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: Text(
                      "Pengaturan 3",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 41, 52, 61),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black45),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: Icon(
                      Icons.settings_outlined,
                      color: Color.fromARGB(255, 41, 52, 61),
                      size: 35,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: Text(
                      "Pengaturan 4",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 41, 52, 61),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black45),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: Icon(
                      Icons.settings_outlined,
                      color: Color.fromARGB(255, 41, 52, 61),
                      size: 35,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: Text(
                      "Pengaturan 5",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 41, 52, 61),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black45),
          ],
        ),
      ),
    );
  }
}
