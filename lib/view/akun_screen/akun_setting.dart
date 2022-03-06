import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_cek_in/view/home_screen/home_page.dart';

class AkunSetting extends StatelessWidget {
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
          padding: EdgeInsets.only(top: 45, left: 30, right: 30),
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 35,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomeScreenPage()));
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
          style: TextStyle(fontSize: 16, color: Colors.green),
        ),
        _buildMargin(20),
        Text(
          "Your Name Here",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        _buildMargin(10),
        Text(
          "11451923344275628849",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        _buildMargin(70),
        Container(
          height: 440,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 246, 250, 249),
              // color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 40, 40, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset('assets/img/person.png', scale: 0.9),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Nama",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black38,
                            ),
                          ),
                          _buildMargin(5),
                          Text(
                            "Your Name",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.edit,
                      color: Colors.black54,
                      size: 30,
                    ),
                  ],
                ),
                _buildMargin(20),
                Container(
                  height: 1,
                  color: Colors.black12,
                ),
                _buildMargin(30),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.email_outlined,
                      color: Colors.green.shade400,
                      size: 42,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "E-mail",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black38,
                            ),
                          ),
                          _buildMargin(5),
                          Text(
                            "Your E-Mail",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.edit,
                      color: Colors.black54,
                      size: 30,
                    ),
                  ],
                ),
                _buildMargin(20),
                Container(
                  height: 1,
                  color: Colors.black12,
                ),
                _buildMargin(30),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.green.shade400,
                      size: 42,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Nomor Telepon",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black38,
                            ),
                          ),
                          _buildMargin(5),
                          Text(
                            "Your Nomor Telepon",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.edit,
                      color: Colors.black54,
                      size: 30,
                    ),
                  ],
                ),
                _buildMargin(20),
                Container(
                  height: 1,
                  color: Colors.black12,
                ),
                _buildMargin(30),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.pin_drop,
                      color: Colors.green.shade400,
                      size: 42,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Alamat",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black38,
                            ),
                          ),
                          _buildMargin(5),
                          Text(
                            "Type your alamat here",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.edit,
                      color: Colors.black54,
                      size: 30,
                    ),
                  ],
                ),
                _buildMargin(20),
                Container(
                  height: 1,
                  color: Colors.black12,
                ),
              ],
            ),
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
