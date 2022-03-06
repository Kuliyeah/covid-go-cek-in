import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

// https://medium.com/flutterdevs/scanning-generating-qr-code-in-flutter-3d5251a61244
class PindaiContainer extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<PindaiContainer> {
  String qrCodeResult;

  bool backCamera = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Scan using: " + (backCamera ? "Front Cam" : "Back Cam")),
          actions: <Widget>[
            IconButton(
              icon:
                  backCamera ? Icon(Icons.camera) : Icon(Icons.camera_outlined),
              onPressed: () {
                setState(() {
                  backCamera = !backCamera;
                  camera = backCamera ? 1 : -1;
                });
              },
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Spacer(),
            Center(
              child: Text(
                (qrCodeResult == null) || (qrCodeResult == "")
                    ? "Silakan lakukan check-in!"
                    : "Result:" + qrCodeResult,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
              child: ButtonTheme(
                minWidth: 100.0,
                height: 45,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: Row(
                    children: <Widget>[
                      Spacer(),
                      Icon(
                        Icons.qr_code_scanner_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text("   Scan QR Code",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                      Spacer(),
                    ],
                  ),
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  onPressed: () async {
                    ScanResult codeSanner = await BarcodeScanner.scan(
                      options: ScanOptions(
                        useCamera: camera,
                      ),
                    );
                    setState(() {
                      qrCodeResult = codeSanner.rawContent;
                    });
                  },
                ),
              ),
            )
          ],
        ));
  }
}

int camera = 1;
