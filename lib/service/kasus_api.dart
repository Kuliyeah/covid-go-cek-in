import 'dart:convert';

import 'package:covid_go_cek_in/models/Kasus.dart';
import '../../../constant/constant.dart';


import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;


const String apiUrl = "https://covid19.mathdro.id/api/countries/idn";
Future<Kasus> fetchPost() async {
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    return Kasus.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data covid-19');
  }
}

class DetailKasus extends StatefulWidget {
  const DetailKasus({Key? key}) : super(key: key);

  @override
  DetailKasusState createState() => DetailKasusState();
}

class DetailKasusState extends State<DetailKasus> {
  late Future<Kasus> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      width: 300.0,
      child: FutureBuilder<Kasus>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                const SizedBox(height: 10),
                Column(
                  children: <Widget>[
                    Text(
                      intl.NumberFormat.decimalPattern()
                          .format(snapshot.data!.deaths),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: dangerColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Meninggal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: dangerColor,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    Text(
                      intl.NumberFormat.decimalPattern()
                          .format(snapshot.data!.confirmeds),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: warningColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "kasus",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: warningColor,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    Text(
                      intl.NumberFormat.decimalPattern()
                          .format(snapshot.data!.recovereds),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 50),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "sembuh",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Pembaruan Terakhir",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 5),
                Text(
                  snapshot.data!.lastUpdate.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: bodyColor,
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const SizedBox(
            height: 40,
            width: 20,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}