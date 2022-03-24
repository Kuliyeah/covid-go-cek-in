import 'package:covid_go_cek_in/constant/constant.dart';
import 'news_tiles.dart';
import 'package:flutter/material.dart';
// import 'package:go_cek_in/models/users.dart';

class HomeContainer extends StatelessWidget {
  // final List<Users> cases;
  HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreenColor,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
    );
  }
}

Widget _buildContent(BuildContext context) {
  return Container(
    color: mainColor,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Image.asset('assets/img/header_home.png'),
          Container(
            decoration: BoxDecoration(
                color: lighterGreenColor,
                // color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildMargin(10),
                  Material(
                    elevation: 5.0,
                    shadowColor: textColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15.0),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                          hintText: 'Bandung, Jawa Barat',
                          hintStyle: TextStyle(fontSize: 15, color: bodyColor),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0.0)),
                          prefixIcon: Icon(Icons.pin_drop, color: bodyColor),
                          suffixIcon: Material(
                            elevation: 5.0,
                            color: Colors.green.shade400,
                            shadowColor: mainColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                            child: Icon(Icons.search, color: Colors.white),
                          ),
                          contentPadding: EdgeInsets.only(top: 15.0),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0))),
                    ),
                  ),
                  _buildMargin(30),
                  Text(
                    "Kasus",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: textColor),
                  ),
                  _buildMargin(10),
                  Row(
                    children: <Widget>[
                      Text(
                        "Update 3 Maret 2021",
                        style: TextStyle(color: bodyColor),
                      ),
                      Spacer(),
                      Text(
                        "Lihat Detail >",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  _buildMargin(20),
                  Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: <Widget>[
                            Spacer(),
                            Column(
                              children: <Widget>[
                                Text("36 rb",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: dangerColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                                Text("Meninggal",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: dangerColor, fontSize: 15))
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: <Widget>[
                                Text("1,6 jt",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: warningColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                                Text("Kasus",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: warningColor, fontSize: 15))
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: <Widget>[
                                Text("1,3 jt",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                                Text("Sembuh",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 15))
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Berita",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: textColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  NewsTiles("adas", "Daerah 1", "Melonjaknya kasus Covid19"),
                  SizedBox(
                    height: 10,
                  ),
                  NewsTiles("adas", "Daerah 2", "Melonjaknya kasus Covid19"),
                  SizedBox(
                    height: 10,
                  ),
                  NewsTiles("adas", "Daerah 3", "Melonjaknya kasus Covid19"),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildMargin(double n) {
  return SizedBox(
    height: n,
  );
}
