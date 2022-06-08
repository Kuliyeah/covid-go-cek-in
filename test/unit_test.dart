import 'package:covid_go_cek_in/helperurl.dart';
import 'package:covid_go_cek_in/view/screen/scan_screen/scan_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('QR code must contain "gocekin"', () {
    expect(validationData("gocekin-20."), true);
  });

  test('Get id mitra from scanned QR Code', () {
    expect(getIDMitraFromScanner("gocekin-2."), "2");
  });

  test('Get url and port', () {
    expect(MyUrl().getUrl(), "http://192.168.1.102:8787");
  });
}
