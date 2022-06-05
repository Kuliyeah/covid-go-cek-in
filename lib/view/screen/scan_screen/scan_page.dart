// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:covid_go_cek_in/helperurl.dart';
import 'package:covid_go_cek_in/view/login_screen/login_page.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

String url = MyUrl().getUrl();

bool validationData(String data) {
  String getData = data.substring(0, 7);
  if (getData == "gocekin") return true;
  return false;
}

String getIDMitraFromScanner(String data) {
  late String dataAsli = data;
  const start = "-";
  const end = ".";

  final startIndex = dataAsli.indexOf(start);
  final endIndex = dataAsli.indexOf(end, startIndex + start.length);
  dataAsli = dataAsli.substring(startIndex + start.length, endIndex);

  return dataAsli;
}

Future insertPengunjung(int idPengunjung, int idMitra) async {
  await http.post(
    "$url/v1/kunjungan",
    body: {
      "idPengunjung": idPengunjung.toString(),
      "idMitra": idMitra.toString(),
      "tanggal": DateTime.now().toString().substring(0, 10),
      "checkin": "Yes",
      "checkout": "No",
      "statusKunjungan": "Selesai",
    },
  );
}

void checkIn(String data) async {
  var response = await http.get("$url/v1/mitra/" + data);
  var decodedData = jsonDecode(response.body);

  checkInData.setBool('checkIn', true);
  checkInData.setInt('idMitra', decodedData['data']['idMitra']);
  checkInData.setString('namaMitra', decodedData['data']['namaMitra']);
  checkInData.setString('alamatMitra', decodedData['data']['alamatMitra']);

  insertPengunjung(
    int.parse(logindata.getInt('id').toString()),
    decodedData['data']['idMitra'],
  );
}

bool checkInValidation() {
  checkInData.setBool('checkIn', true);
  return true;
}
