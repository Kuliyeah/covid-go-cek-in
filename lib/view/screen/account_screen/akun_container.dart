import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:covid_go_cek_in/view/login_screen/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'akun_setting.dart';
import 'package:flutter/material.dart';
import 'tiles_account_setting.dart';

class AkunContainer extends StatefulWidget {
  const AkunContainer({Key? key}) : super(key: key);

  @override
  AkunContainerState createState() => AkunContainerState();
}

late SharedPreferences logindata;
var username = "user";

class AkunContainerState extends State<AkunContainer> {
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lighterGreenColor,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      color: textColor,
                      size: 35,
                    ),
                    onTap: () {
                      logindata.setBool('login', true);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const LoginPage(),
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Berhasil logout"),
                          duration: Duration(milliseconds: 1000),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: Icon(
                      Icons.settings_outlined,
                      color: textColor,
                      size: 35,
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const AkunSetting()));
                    },
                  ),
                ],
              ),
            ),
            _buildMargin(20),
            Image.asset('assets/img/avatar/avatar_13.png', height: 150),
            _buildMargin(15),
            Text(
              "Ganti Avatar",
              style: TextStyle(fontSize: 16, color: mainColor),
            ),
            _buildMargin(20),
            Text(
              "Your Name Here",
              style: TextStyle(
                  fontSize: 20, color: textColor, fontWeight: FontWeight.bold),
            ),
            _buildMargin(10),
            Text(
              "11451923344275628849",
              style: TextStyle(
                fontSize: 15,
                color: textColor,
              ),
            ),
            _buildMargin(70),
            Container(
              height: 440,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  // color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const TilesAccountSetting(
                        Icons.person, 'Nama', 'Gilang Gumelar'),
                    _buildMargin(20),
                    Container(
                      height: 1,
                      color: textColor,
                    ),
                    _buildMargin(30),
                    const TilesAccountSetting(Icons.mail_outline, 'E-Mail',
                        'gilanggumelar@gmail.com'),
                    _buildMargin(20),
                    Container(
                      height: 1,
                      color: textColor,
                    ),
                    _buildMargin(30),
                    const TilesAccountSetting(Icons.phone, 'Nomor Telepon',
                        'gilanggumelar@gmail.com'),
                    _buildMargin(20),
                    Container(
                      height: 1,
                      color: textColor,
                    ),
                    _buildMargin(30),
                    const TilesAccountSetting(Icons.pin_drop_outlined, 'Alamat',
                        'gilanggumelar@gmail.com'),
                    _buildMargin(20),
                    Container(
                      height: 1,
                      color: textColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
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
