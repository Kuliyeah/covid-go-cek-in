import 'package:covid_go_cek_in/view/screen/main_screen.dart';
import 'package:flutter/material.dart';
import '../lupa_password_screen/lupa_password_page.dart';
import '../register_screen/register_page.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

bool _showPassword = false;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      resizeToAvoidBottomInset: false,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to exit'),
        ),
        child: _buildContent(context),
      ),
    );
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
              Image.asset(
                'assets/img/icon.png',
                height: 150,
              ),
              _buildMargin(30),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  )),
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
                  hintText: "Username",
                  hintStyle:
                      const TextStyle(fontSize: 15, color: Colors.black45),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              _buildMargin(20),
              TextFormField(
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: _showPassword ? Colors.green : Colors.black87,
                    ),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(left: 25),
                  hintText: "Password",
                  hintStyle:
                      const TextStyle(fontSize: 15, color: Colors.black45),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              _buildMargin(40),
              ButtonTheme(
                minWidth: 100.0,
                height: 45,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: const Text("Masuk",
                      style: TextStyle(fontWeight: FontWeight.bold)),
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
              _buildMargin(60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Belum Punya Akun?",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    child: const Text(
                      "  Daftar Disini!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.green,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const RegisterPage()));
                    },
                  )
                ],
              ),
              _buildMargin(20),
              GestureDetector(
                child: const Text(
                  "Lupa Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.green,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const LupaPasswordPage()));
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
