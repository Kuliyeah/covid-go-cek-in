import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:covid_go_cek_in/view/akun_screen/akun_setting.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lighterGreenColor,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Terms of Service",
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
      MaterialPageRoute(builder: (BuildContext context) => AkunSetting()));
}

Widget _buildContent(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: SafeArea(
        child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Versi yang terinstal 1.0.2"),
          _buildMargin(5),
          Divider(color: Colors.black45),
          _buildMargin(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Versi 1.0.2",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildMargin(5),
              Text("Target API Level: 30 (Android 11)"),
              _buildMargin(5),
              Text("Minimum API Level: 21 (Lolipop)"),
              _buildMargin(5),
              Text("Tanggal Rilis: 24 Maret 2022"),
              _buildMargin(10),
              Text(
                "Release Notes:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              _buildMargin(5),
              Text("- Penambahan fitur lihat dan edit profile"),
              _buildMargin(5),
              Text("- Penambahan fitur riwayat check-in"),
              _buildMargin(5),
              Text("- Penambahan fitur berita"),
              _buildMargin(5),
              Text("- Fix bug lihat berita"),
              _buildMargin(30),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Versi 1.0.1",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildMargin(5),
              Text("Target API Level: 30 (Android 11)"),
              _buildMargin(5),
              Text("Minimum API Level: 21 (Lolipop)"),
              _buildMargin(5),
              Text("Tanggal Rilis: 20 Maret 2022"),
              _buildMargin(10),
              Text(
                "Release Notes:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              _buildMargin(5),
              Text("- Fix bug login"),
              _buildMargin(5),
              Text("- Fix bug daftar akun"),
              _buildMargin(30),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Versi 1.0.0",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildMargin(5),
              Text("Target API Level: 30 (Android 11)"),
              _buildMargin(5),
              Text("Minimum API Level: 21 (Lolipop)"),
              _buildMargin(5),
              Text("Tanggal Rilis: 20 Maret 2022"),
              _buildMargin(10),
              Text(
                "Release Notes:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              _buildMargin(5),
              Text("- Penambahan fitur login"),
              _buildMargin(5),
              Text("- Penambahan fitur daftar akun"),
              _buildMargin(5),
              Text("- Penambahan fitur scan check-in"),
              _buildMargin(30),
            ],
          )
        ],
      ),
    )),
  );
}

Widget _buildMargin(double n) {
  return SizedBox(
    height: n,
  );
}
