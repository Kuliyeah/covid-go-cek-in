import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_cek_in/view/home_screen/home_page.dart';

class HistoryPage extends StatelessWidget {
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
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 60, left: 30, right: 30),
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 25,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomeScreenPage()));
                },
              ),
              Spacer(),
              Text(
                "Riwayat Check-in",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Material(
            elevation: 5.0,
            shadowColor: Colors.black38,
            borderRadius: BorderRadius.circular(15.0),
            child: TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                  hintText: 'Cari riwayat tempat',
                  hintStyle: TextStyle(fontSize: 15, color: Colors.black45),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0)),
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
                  contentPadding: EdgeInsets.only(top: 15.0, left: 20),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.white, width: 3.0))),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "ABATA Coffee",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "3 Maret 2011",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Text(
                            "Jl. In Aja Dulu, Gg Cocok Yaudahlah adwa da wadawdaw wa dwa daw a",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "9.30 - 10.00 WIB",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Card(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "ABATA Coffee",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "3 Maret 2011",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Text(
                            "Jl. In Aja Dulu, Gg Cocok Yaudahlah",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "9.30 - 10.00 WIB",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Card(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "ABATA Coffee",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "3 Maret 2011",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Text(
                            "Jl. In Aja Dulu, Gg Cocok Yaudahlah adwa da wadawdaw wa dwa daw a",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "9.30 - 10.00 WIB",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Card(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "ABATA Coffee",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "3 Maret 2011",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Text(
                            "Jl. In Aja Dulu, Gg Cocok Yaudahlah",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "9.30 - 10.00 WIB",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Card(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "ABATA Coffee",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "3 Maret 2011",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Text(
                            "Jl. In Aja Dulu, Gg Cocok Yaudahlah adwa da wadawdaw wa dwa daw a",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "9.30 - 10.00 WIB",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              _buildMargin(20),
              GestureDetector(
                child: Text(
                  "Lihat Lebih Banyak >",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              _buildMargin(30)
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildMargin(double n) {
  return SizedBox(
    height: n,
  );
}
