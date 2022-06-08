import 'package:covid_go_cek_in/models/Kasus.dart';
import '../../../constant/constant.dart';
import 'package:covid_go_cek_in/service/kasus_api.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;


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
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
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
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Meninggal",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: dangerColor,
                              fontSize: 15,
                            ),
                          )
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
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Kasus",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: warningColor,
                              fontSize: 15,
                            ),
                          )
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
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Sembuh",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                            ),
                          )
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