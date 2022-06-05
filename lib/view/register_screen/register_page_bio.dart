// ignore_for_file: deprecated_member_use
import 'package:covid_go_cek_in/view/login_screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../register_screen/register_page.dart';
import 'package:covid_go_cek_in/helperurl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
enum Kelamin { Pria, Wanita }

// ignore: must_be_immutable
class RegisterPageBio extends StatefulWidget {
  String username;
  String password;

  // receive data from the FirstScreen as a parameter
  RegisterPageBio({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  State<RegisterPageBio> createState() => _RegisterPageBioState();
}

class _RegisterPageBioState extends State<RegisterPageBio> {
  @override
  void initState(){
    super.initState();
  }
  TextEditingController namaController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();

  DateTime ttlController = DateTime.now();
  Kelamin? _gender = Kelamin.Pria;
  String url = MyUrl().getUrl();

  String age() {
    DateTime ttl = DateFormat("yyyy-MM-dd").parse(ttlController.toString());
    DateTime today = DateTime.now();
    int umur = today.year - ttl.year;
    return umur.toString();
  }

  Future insertPengunjung() async {
    await http.post(
      "$url/v1/pengunjung",
      body: {
        "usernamePengunjung": widget.username,
        "passwordPengunjung":
            md5.convert(utf8.encode(widget.password)).toString(),
        "namaPengunjung": namaController.text,
        "nikPengunjung": nikController.text,
        "alamatPengunjung": alamatController.text,
        "noHpPengunjung": noHpController.text,
        "umurPengunjung": age(),
        "jenisKelaminPengunjung": _gender.toString().split('.').last,
        "statusKesehatan": "Negatif",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
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
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                    ),
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
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                    ),
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
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RadioListTile<Kelamin>(
                      title: const Text(
                        "Pria",
                        style: TextStyle(fontSize: 15),
                      ),
                      value: Kelamin.Pria,
                      groupValue: _gender,
                      onChanged: (Kelamin? value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                    RadioListTile<Kelamin>(
                      title: const Text(
                        "Wanita",
                        style: TextStyle(fontSize: 15),
                      ),
                      value: Kelamin.Wanita,
                      groupValue: _gender,
                      onChanged: (Kelamin? value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: tglLahirController,
                        readOnly: true,
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
                          hintStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.black45,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    ButtonTheme(
                      minWidth: 15.0,
                      height: 40.0,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime(1900, 1, 1),
                            maxTime: DateTime.now(),
                            currentTime: DateTime.now(),
                            locale: LocaleType.en,
                            onChanged: (date) {
                              ttlController = DateFormat("yyyy-MM-dd")
                                  .parse(date.toString());
                            },
                            onConfirm: (date) {
                              setState(() {
                                tglLahirController.text =
                                    date.toString().substring(0, 10);
                              });
                            },
                          );
                        },
                        child: const Icon(Icons.date_range_outlined),
                      ),
                    ),
                  ],
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
                    contentPadding: const EdgeInsets.only(
                      left: 25,
                      top: 50,
                    ),
                    hintText: "Alamat",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                    ),
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
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                _buildMargin(20),
                ButtonTheme(
                  minWidth: 100.0,
                  height: 45,
                  child: RaisedButton(
                    child: const Text("Daftar"),
                    color: Colors.green,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      insertPengunjung();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Berhasil Daftar Akun"),
                          duration: Duration(milliseconds: 1000),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const LoginPage(),
                        ),
                      );
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
                        builder: (BuildContext context) => const RegisterPage(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildMargin(double n) {
  return SizedBox(
    height: n,
  );
}
