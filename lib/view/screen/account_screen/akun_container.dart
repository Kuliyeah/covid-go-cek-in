import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:covid_go_cek_in/view/screen/main_screen.dart';
import 'akun_setting.dart';
import 'package:flutter/material.dart';
import 'tiles_account_setting.dart';

class AkunContainer extends StatefulWidget {
  const AkunContainer({Key? key}) : super(key: key);

  @override
  AkunContainerState createState() => AkunContainerState();
}

class AkunContainerState extends State<AkunContainer> {
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
                              const AkunSetting(),
                        ),
                      );
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
              decodedData['data']['namaPengunjung'],
              style: TextStyle(
                  fontSize: 20, color: textColor, fontWeight: FontWeight.bold),
            ),
            _buildMargin(10),
            Text(
              decodedData['data']['nikPengunjung'],
              style: TextStyle(
                fontSize: 15,
                color: textColor,
              ),
            ),
            _buildMargin(50),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TilesAccountSetting(Icons.abc, 'Username',
                        decodedData['data']['usernamePengunjung']),
                    _buildMargin(20),
                    Container(
                      height: 1,
                      color: textColor,
                    ),
                    _buildMargin(30),
                    TilesAccountSetting(Icons.person, 'Nama',
                        decodedData['data']['namaPengunjung']),
                    _buildMargin(20),
                    Container(
                      height: 1,
                      color: textColor,
                    ),
                    _buildMargin(30),
                    TilesAccountSetting(Icons.phone, 'Nomor Telepon',
                        decodedData['data']['noHpPengunjung']),
                    _buildMargin(20),
                    Container(
                      height: 1,
                      color: textColor,
                    ),
                    _buildMargin(30),
                    TilesAccountSetting(Icons.pin_drop_outlined, 'Alamat',
                        decodedData['data']['alamatPengunjung']),
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
