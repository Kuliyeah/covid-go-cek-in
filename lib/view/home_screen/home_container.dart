import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_cek_in/models/users.dart';

class HomeContainer extends StatelessWidget {
  final List<Users> cases;
  HomeContainer({Key key, this.cases}) : super(key: key);

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
  return Container(
    color: Color.fromARGB(255, 93, 212, 130),
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Image.asset('assets/img/header_home.png'),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 250, 249),
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
                    shadowColor: Colors.black38,
                    borderRadius: BorderRadius.circular(15.0),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                          hintText: 'Bandung, Jawa Barat',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.black45),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0.0)),
                          prefixIcon:
                              Icon(Icons.pin_drop, color: Colors.black38),
                          suffixIcon: Material(
                            elevation: 5.0,
                            color: Colors.green.shade400,
                            shadowColor: Colors.green,
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  _buildMargin(10),
                  Row(
                    children: <Widget>[
                      Text(
                        "Update 3 Maret 2021",
                        style: TextStyle(color: Colors.black38),
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
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                                Text("Meninggal",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 15))
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: <Widget>[
                                Text("1,6 jt",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                                Text("Kasus",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.yellow, fontSize: 15))
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
                  _buildMargin(30),
                  Text(
                    "Peta Persebaran",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  _buildMargin(20),
                  Image.asset(
                    'assets/img/dummyMaps.png',
                    scale: 0.9,
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

Widget _buildMargin(double n) {
  return SizedBox(
    height: n,
  );
}
