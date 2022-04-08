import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'visitor_screen/visitor_page.dart';

// https://medium.com/flutterdevs/scanning-generating-qr-code-in-flutter-3d5251a61244
class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  String _data = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pindai", style: TextStyle(fontSize: 24)),
      ),
      body: Center(
        child: TextButton(
          child: (_data !="")? Text(_data, style: TextStyle(fontSize: 24),):Text("Pindai Sekarang", style: TextStyle(fontSize: 24)),
          onPressed: () async {
            // await FlutterBarcodeScanner.scanBarcode(
            //         "#000000", "Cancle", true, ScanMode.QR)
            //     .then((value) => setState(() => _data = value));
            Navigator.push(context, MaterialPageRoute(builder: (context) => VisitorPage()));
          },
        ),
      ),
    );
  }
}
