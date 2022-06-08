// ignore_for_file: sort_child_properties_last, use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:covid_go_cek_in/helperurl.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import '../login_screen/login_page.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

final usernameController = TextEditingController();
final passwordController = TextEditingController();

class LupaPasswordPage extends StatelessWidget {
  const LupaPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
    );
  }
}

Widget _buildContent(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Lupa Akun",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
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
                hintStyle: const TextStyle(fontSize: 15, color: Colors.black45),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            _buildMargin(20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 25),
                hintText: "Password Terakhir Yang Di Ingat",
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
                child: const Text("Pulihkan Akun",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                color: Colors.green,
                textColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                onPressed: () async {
                  String username = usernameController.text;

                  String url = MyUrl().getUrl();
                  var response = await http
                      .get(Uri.parse("$url/v1/pengunjung/login/$username"));
                  var decodedData = jsonDecode(response.body);

                  if (decodedData != null) {
                    if (username == decodedData['data']['usernamePengunjung'] ||
                        username.length ==
                            decodedData['data']['usernamePengunjung']
                                .toString()
                                .length ||
                        username.substring(0, 3) ==
                            decodedData['data']['usernamePengunjung']
                                .toString()
                                .substring(0, 3) ||
                        username.substring(3, 6) ==
                            decodedData['data']['usernamePengunjung']
                                .toString()
                                .substring(3, 6)) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Change Password'),
                          content: SizedBox(
                            height: 50,
                            child: Column(
                              children: [
                                TextField(
                                  controller: passwordController,
                                  autofocus: true,
                                  decoration: const InputDecoration(
                                      hintText: 'New Password'),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                updateData(
                                    "passwordPengunjung", "editpassword");
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Password berhasil diperbarui"),
                                    duration: Duration(milliseconds: 1000),
                                  ),
                                );
                              },
                              child: const Text("SUBMIT"),
                            )
                          ],
                        ),
                      );
                    }
                  }
                },
              ),
            ),
            _buildMargin(20),
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
                    builder: (BuildContext context) => const LoginPage(),
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

Future updateData(String field, String data) async {
  String url = MyUrl().getUrl();
  String urlPengunjung =
      "$url/v1/pengunjung/$data/" + logindata.getString('username').toString();
  await http.put(
    Uri.parse(urlPengunjung),
    body: {field: md5.convert(utf8.encode(passwordController.text)).toString()},
  );
}
