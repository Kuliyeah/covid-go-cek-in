import 'package:covid_go_cek_in/constant/constant.dart';
import '../akun_setting.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lighterGreenColor,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Terms of Service",
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
          builder: (BuildContext context) => const AkunSetting()));
}

Widget _buildContent(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Versi yang terinstal 1.0.2"),
          _buildMargin(5),
          const Divider(color: Colors.black45),
          _buildMargin(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Versi 1.0.2",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildMargin(5),
              const Text("Target API Level: 30 (Android 11)"),
              _buildMargin(5),
              const Text("Minimum API Level: 21 (Lolipop)"),
              _buildMargin(5),
              const Text("Tanggal Rilis: 24 Maret 2022"),
              _buildMargin(10),
              const Text(
                "Release Notes:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              _buildMargin(5),
              const Text("- Penambahan fitur lihat dan edit profile"),
              _buildMargin(5),
              const Text("- Penambahan fitur riwayat check-in"),
              _buildMargin(5),
              const Text("- Penambahan fitur berita"),
              _buildMargin(5),
              const Text("- Fix bug lihat berita"),
              _buildMargin(30),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Versi 1.0.1",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildMargin(5),
              const Text("Target API Level: 30 (Android 11)"),
              _buildMargin(5),
              const Text("Minimum API Level: 21 (Lolipop)"),
              _buildMargin(5),
              const Text("Tanggal Rilis: 20 Maret 2022"),
              _buildMargin(10),
              const Text(
                "Release Notes:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              _buildMargin(5),
              const Text("- Fix bug login"),
              _buildMargin(5),
              const Text("- Fix bug daftar akun"),
              _buildMargin(30),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Versi 1.0.0",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildMargin(5),
              const Text("Target API Level: 30 (Android 11)"),
              _buildMargin(5),
              const Text("Minimum API Level: 21 (Lolipop)"),
              _buildMargin(5),
              const Text("Tanggal Rilis: 20 Maret 2022"),
              _buildMargin(10),
              const Text(
                "Release Notes:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              _buildMargin(5),
              const Text("- Penambahan fitur login"),
              _buildMargin(5),
              const Text("- Penambahan fitur daftar akun"),
              _buildMargin(5),
              const Text("- Penambahan fitur scan check-in"),
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
