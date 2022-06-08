// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, sort_child_properties_last

import 'dart:convert';

import 'package:covid_go_cek_in/helperurl.dart';
import 'package:flutter/material.dart';
import '../login_screen/login_page.dart';
import '../register_screen/register_page_bio.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    String url = MyUrl().getUrl();

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'assets/img/icon.png',
                height: 150,
              ),
              _buildMargin(20),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(left: 25),
                  hintText: "Username",
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
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(left: 25),
                  hintText: "Password",
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
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(left: 25),
                  hintText: "Konfirmasi Password",
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              _buildMargin(30),
              ButtonTheme(
                minWidth: 100.0,
                height: 45,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: const Text(
                    "Selanjutnya",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    String urlLogin = "$url/v1/pengunjung/login/";
                    var response = await http.get(
                      Uri.parse(urlLogin + usernameController.text),
                    );
                    var decodedData = jsonDecode(response.body);

                    if (decodedData['success'] == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Username sudah terdaftar, silakan ganti username lain",
                          ),
                          duration: Duration(milliseconds: 1000),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPageBio(
                            username: usernameController.text,
                            password: passwordController.text,
                          ),
                        ),
                      );
                    }
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
                      builder: (context) => const LoginPage(),
                    ),
                  );
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
}
