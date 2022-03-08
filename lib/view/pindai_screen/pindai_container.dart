import 'package:flutter/material.dart';

// https://medium.com/flutterdevs/scanning-generating-qr-code-in-flutter-3d5251a61244
class PindaiContainer extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<PindaiContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pindai"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Rifky Lovanto - 1302194068',
            ),
          ],
        ),
      ),
    );
  }
}
