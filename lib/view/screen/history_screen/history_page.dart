import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:flutter/material.dart';
import 'tiles.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lighterGreenColor,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Riwayat",
        ),
      ),
    );
  }
}

Widget _buildContent(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: <Widget>[
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
              Tiles("Abata Coffe", "Jl. In Aja Dulu, Gg Cocok Yaudahlah",
                  "3 Maret 2021", "9.30 - 10.00 WIB"),
              SizedBox(height: 8),
              Tiles("Abata Coffe", "Jl. In Aja Dulu, Gg Cocok Yaudahlah",
                  "3 Maret 2021", "9.30 - 10.00 WIB"),
              SizedBox(height: 8),
              Tiles("Abata Coffe", "Jl. In Aja Dulu, Gg Cocok Yaudahlah",
                  "3 Maret 2021", "9.30 - 10.00 WIB"),
              SizedBox(height: 8),
              Tiles("Abata Coffe", "Jl. In Aja Dulu, Gg Cocok Yaudahlah",
                  "3 Maret 2021", "9.30 - 10.00 WIB"),
              SizedBox(height: 8),
              Tiles("Abata Coffe", "Jl. In Aja Dulu, Gg Cocok Yaudahlah",
                  "3 Maret 2021", "9.30 - 10.00 WIB"),
              SizedBox(height: 8),
              Tiles("Abata Coffe", "Jl. In Aja Dulu, Gg Cocok Yaudahlah",
                  "3 Maret 2021", "9.30 - 10.00 WIB"),
              SizedBox(height: 8),
              Tiles("Abata Coffe", "Jl. In Aja Dulu, Gg Cocok Yaudahlah",
                  "3 Maret 2021", "9.30 - 10.00 WIB"),
              SizedBox(height: 8),
              Tiles("Abata Coffe", "Jl. In Aja Dulu, Gg Cocok Yaudahlah",
                  "3 Maret 2021", "9.30 - 10.00 WIB"),
              SizedBox(height: 8),
              _buildMargin(20)
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
