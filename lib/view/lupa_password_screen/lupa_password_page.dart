import 'package:flutter/material.dart';
import '../screen/main_screen.dart';
import '../login_screen/login_page.dart';

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
            Image.asset(
              'assets/img/icon.png',
              height: 150,
            ),
            _buildMargin(30),
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
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const MainScreen(),
                    ),
                  );
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
