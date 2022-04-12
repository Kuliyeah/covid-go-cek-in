import 'package:flutter/material.dart';
import '../screen/main_screen.dart';
import '../register_screen/register_page.dart';

// ignore: constant_identifier_names
enum Kelamin { Pria, Wanita }

Kelamin _kelaminChecked = Kelamin.Pria;

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
    TextEditingController passwordController = TextEditingController();
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
                          groupValue: _kelaminChecked,
                          activeColor: Colors.green,
                          onChanged: (value) {
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
                          groupValue: _kelaminChecked,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            //do your operation while chaning value
                          }),
                    )),
              ],
            ),
            TextFormField(
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
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const MainScreen()));
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
