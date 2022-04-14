import 'package:covid_go_cek_in/models/Pengunjung.dart';
import 'package:covid_go_cek_in/view/login_screen/login_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import '../screen/main_screen.dart';
import '../register_screen/register_page.dart';
import 'package:covid_go_cek_in/helperurl.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
enum Kelamin { Pria, Wanita }

// Kelamin _kelaminChecked = Kelamin.Pria;

// ignore: must_be_immutable
class RegisterPageBio extends StatelessWidget {
  String username;
  String password;

  // receive data from the FirstScreen as a parameter
  RegisterPageBio({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context, username, password),
    );
  }
}

Widget _buildContent(BuildContext context, String username, String password) {
  TextEditingController namaController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  Kelamin? _gender = Kelamin.Pria;
  TextEditingController ttlController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  int umur = 18;

  Future insertPengunjung() async {
    String url = MyUrl().getUrl();
    final response = await http.post("$url/v1/pengunjung", body: {
      "usernamePengunjung": username,
      "passwordPengunjung": password,
      "namaPengunjung": namaController.text,
      "nikPengunjung": nikController.text,
      "alamatPengunjung": alamatController.text,
      "noHpPengunjung": noHpController.text,
      "umurPengunjung": "18",
      "jenisKelaminPengunjung": _gender.toString().split('.').last,
      "statusKesehatan": "Negatif",
    });
  }

  return Center(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(username),
            Text(password),
            _buildMargin(20),
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 25),
                hintText: "Nama Lengkap",
                hintStyle: const TextStyle(fontSize: 15, color: Colors.black45),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            _buildMargin(20),
            TextFormField(
              controller: noHpController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 25),
                hintText: "No. Telp",
                hintStyle: const TextStyle(fontSize: 15, color: Colors.black45),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            _buildMargin(20),
            TextFormField(
              controller: nikController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 25),
                hintText: "NIK",
                hintStyle: const TextStyle(fontSize: 15, color: Colors.black45),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    flex: 5,
                    child: ListTile(
                      title: const Text('Pria', style: TextStyle(fontSize: 15)),
                      // ignore: missing_required_param
                      leading: Radio<Kelamin>(
                          value: Kelamin.Pria,
                          groupValue: _gender,
                          activeColor: Colors.green,
                          onChanged: (Kelamin? value) {
                            _gender = value;
                            //do your operation while chaning value
                          }),
                    )),
                Expanded(
                    flex: 7,
                    child: ListTile(
                      title:
                          const Text('Wanita', style: TextStyle(fontSize: 15)),
                      // ignore: missing_required_param
                      leading: Radio<Kelamin>(
                          value: Kelamin.Wanita,
                          groupValue: _gender,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            _gender = value;
                            //do your operation while chaning value
                          }),
                    )),
              ],
            ),
            TextFormField(
              controller: ttlController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 25),
                hintText: "Tanggal Lahir",
                hintStyle: const TextStyle(fontSize: 15, color: Colors.black45),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            _buildMargin(20),
            TextField(
              controller: alamatController,
              maxLines: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 25, top: 50),
                hintText: "Alamat",
                hintStyle: const TextStyle(fontSize: 15, color: Colors.black45),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            _buildMargin(20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 25),
                hintText: "Email",
                hintStyle: const TextStyle(fontSize: 15, color: Colors.black45),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            _buildMargin(20),
            ButtonTheme(
              minWidth: 100.0,
              height: 45,
              // ignore: deprecated_member_use
              child: RaisedButton(
                child: const Text("Daftar"),
                color: Colors.green,
                textColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: () async {
                  insertPengunjung();
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //   content: Text("Berhasil Daftar Akun"),
                  //   duration: Duration(milliseconds: 1000),
                  // ));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const LoginPage()));
                },
              ),
            ),
            _buildMargin(30),
            GestureDetector(
              child: const Text(
                "Kembali",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.green,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const RegisterPage()));
              },
            )
          ],
        ),
      ),
    ),
  );
}

Widget _buildMargin(double n) {
  return SizedBox(
    height: n,
  );
}
