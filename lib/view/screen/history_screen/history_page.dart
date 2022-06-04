import 'dart:convert';

import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:covid_go_cek_in/helperurl.dart';
import 'package:covid_go_cek_in/models/Kunjungan.dart';
import 'package:flutter/material.dart';
import 'tiles.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  HistoryPageState createState() => HistoryPageState();
}

TextEditingController searchBarController = TextEditingController();

class HistoryPageState extends State<HistoryPage> {
  late Future<Kunjungan> futurePost;

  @override
  void initState() {
    super.initState();
    searchBarController.text = "";
  }

  String apiUrl = MyUrl().getUrl() + "/v1/kunjungan/9";
  Future<List<dynamic>> _fecthDataUsers() async {
    if (searchBarController.text != "") {
      apiUrl = MyUrl().getUrl() + "/v1/kunjungan/9/" + searchBarController.text;
    }
    var result = await http.get(apiUrl);
    return json.decode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lighterGreenColor,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Material(
                elevation: 5.0,
                shadowColor: Colors.black38,
                borderRadius: BorderRadius.circular(15.0),
                child: TextFormField(
                  onChanged: ((value) {
                    setState(() {
                      _fecthDataUsers();
                    });
                  }),
                  controller: searchBarController,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Masukan nama, alamat atau tanggal kunjungan',
                    hintStyle:
                        const TextStyle(fontSize: 15, color: Colors.black45),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    suffixIcon: GestureDetector(
                      child: Material(
                        elevation: 5.0,
                        color: Colors.green.shade400,
                        shadowColor: Colors.green,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                        ),
                        child: const Icon(Icons.search, color: Colors.white),
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(top: 15.0, left: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 3.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 250,
                    child: FutureBuilder<List<dynamic>>(
                      future: _fecthDataUsers(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: <Widget>[
                                  Tiles(
                                    snapshot.data![index]['namaMitra']
                                        .toString(),
                                    snapshot.data![index]['alamatMitra']
                                        .toString(),
                                    snapshot.data![index]['tanggal'].toString(),
                                  )
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
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
                  ),
                  _buildMargin(20)
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Riwayat",
        ),
      ),
    );
  }
}

Widget _buildMargin(double n) {
  return SizedBox(
    height: n,
  );
}
