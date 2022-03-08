import 'package:flutter/material.dart';
import '../login_screen/login_page.dart';
import '../register_screen/register_page_bio.dart';

class RegisterPage extends StatefulWidget {
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
    // this allows us to access the TextField text
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(40.0),
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
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(left: 25),
                  hintText: "Username",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.black45),
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
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(left: 25),
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.black45),
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
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(left: 25),
                  hintText: "Konfirmasi Password",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.black45),
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
                  child: Text("Selanjutnya",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPageBio(
                                username: usernameController.text,
                                password: passwordController.text)));
                  },
                ),
              ),
              _buildMargin(30),
              GestureDetector(
                child: Text(
                  "Kembali",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.green,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
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
