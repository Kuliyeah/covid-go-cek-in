import 'package:covid_go_cek_in/view/screen/scan_screen/scan_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Scanner QR Code', () {
    test('QR code must contain "gocekin"', () {
      expect(validationData("gocekin-20"), true);
    });
    test('Get id mitra from scanned QR Code', () {
      expect(getIDMitraFromScanner("gocekin-20"), "20");
    });
    test('Kode QR ', () {});
  });
}
