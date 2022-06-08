// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../../../service/sql.dart';

class BeritaList extends StatefulWidget {
  const BeritaList({Key? key}) : super(key: key);

  @override
  State<BeritaList> createState() => _BeritaList();
}

class _BeritaList extends State<BeritaList> {
  Future<List<dynamic>> _refreshJournals() async {
    final data = await SQLHelper.getItems();
    return data.toList();
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _refreshJournals(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,margin: const EdgeInsets.only(top: 8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFDB8B8),
                        ),
                        child: const Image(
                            image: AssetImage('assets/img/virus.png')),
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
                              snapshot.data[index]['place'],
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 210),
                              child: Text(
                                snapshot.data[index]['desc'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF888888),
                                ),
                                softWrap: true,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
