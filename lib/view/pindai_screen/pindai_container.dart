import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// https://medium.com/flutterdevs/scanning-generating-qr-code-in-flutter-3d5251a61244
class PindaiContainer extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<PindaiContainer> {
  @override
  String _data = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pindai"),
      ),
      body: Center(
        child: TextButton(
          child: (_data !="")? Text(_data):Text("Pindai Sekarang"),
          onPressed: () async {
            await FlutterBarcodeScanner.scanBarcode(
                    "#000000", "Cancle", true, ScanMode.QR)
                .then((value) => setState(() => _data = value));
          },
        ),
      ),
    );
  }
}
