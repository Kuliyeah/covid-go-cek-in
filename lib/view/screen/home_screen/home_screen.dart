import 'package:covid_go_cek_in/models/Kasus.dart';
import 'package:covid_go_cek_in/view/login_screen/login_page.dart';
import 'package:covid_go_cek_in/view/screen/main_screen.dart';
import 'package:flutter/material.dart';
import '../../../constant/constant.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreenColor,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
    );
  }
}

Widget alreadyCheckin(BuildContext context) {
  if (checkInData.getBool('checkIn') == true) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Status Check-in",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: textColor),
        ),
        const SizedBox(height: 10),
        Text(
          checkInData.getString('namaMitra').toString(),
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 5),
        Text(
          checkInData.getString('alamatMitra').toString(),
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 10),
        FractionallySizedBox(
          widthFactor: 1,
          // ignore: deprecated_member_use
          child: RaisedButton(
            child: const Text(
              "Check-out",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            color: Colors.red,
            textColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            onPressed: () {
              checkInData.setBool('checkIn', false);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Berhasil Check-out"),
                  duration: Duration(milliseconds: 1000),
                ),
              );

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const MainScreen(),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
  return const SizedBox.shrink();
}

Widget _buildContent(BuildContext context) {
  return Container(
    color: mainColor,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Image.asset('assets/img/header_home.png'),
          Container(
            decoration: BoxDecoration(
              color: lighterGreenColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 10),
                  alreadyCheckin(context),
                  Text(
                    "Kasus",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: textColor),
                  ),
                  const SizedBox(height: 10),
                  const KasusContainer(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Berita",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: textColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const NewsTiles("Daerah 1", "Melonjaknya kasus Covid19"),
                  const SizedBox(
                    height: 10,
                  ),
                  const NewsTiles("Daerah 2", "Melonjaknya kasus Covid19"),
                  const SizedBox(
                    height: 10,
                  ),
                  const NewsTiles("Daerah 3", "Melonjaknya kasus Covid19"),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

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
                          fontSize: 50),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Meninggal",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: dangerColor, fontSize: 25),
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
                          fontSize: 50),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "kasus",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: warningColor, fontSize: 25),
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
                      style: TextStyle(color: Colors.green, fontSize: 25),
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
                  style: TextStyle(fontSize: 15, color: bodyColor),
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

class KasusContainer extends StatefulWidget {
  const KasusContainer({Key? key}) : super(key: key);

  @override
  KasusContainerState createState() => KasusContainerState();
}

class KasusContainerState extends State<KasusContainer> {
  late Future<Kasus> futurePost;
  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Kasus>(
      future: futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Update " + snapshot.data!.lastUpdate.toString(),
                    style: TextStyle(color: bodyColor),
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: const Text(
                      "Lihat Detail >",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            title: Text('Detail Kasus Covid-19'),
                            content: DetailKasus(),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      const Spacer(),
                      Column(
                        children: <Widget>[
                          Text(
                            intl.NumberFormat.decimalPattern()
                                    .format(snapshot.data!.deaths)
                                    .substring(0, 3) +
                                " k",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: dangerColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          const SizedBox(height: 5),
                          Text("Meninggal",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: dangerColor, fontSize: 15))
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: <Widget>[
                          Text(
                            intl.NumberFormat.decimalPattern()
                                    .format(snapshot.data!.confirmeds)
                                    .substring(0, 3) +
                                " jt",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: warningColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          const SizedBox(height: 5),
                          Text("Kasus",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: warningColor, fontSize: 15))
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: <Widget>[
                          Text(
                            intl.NumberFormat.decimalPattern()
                                    .format(snapshot.data!.recovereds)
                                    .substring(0, 3) +
                                " jt",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          const SizedBox(height: 5),
                          const Text("Sembuh",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.green, fontSize: 15))
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
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
    );
  }
}

// ignore: must_be_immutable
class NewsTiles extends StatelessWidget {
  final String _description;
  // final String _imgUrl;
  final String _title;

  const NewsTiles(this._title, this._description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 84,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: const BoxDecoration(
                color: Color(0xFFFDB8B8),
              ),
              child: const Image(image: AssetImage('assets/img/virus.png')),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _title,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    _description,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF888888),
                    ),
                    softWrap: true,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
