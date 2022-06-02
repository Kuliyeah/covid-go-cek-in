// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Bantuan_page extends StatefulWidget {
  const Bantuan_page({Key? key}) : super(key: key);

  @override
  State<Bantuan_page> createState() => _Bantuan_pageState();
}

class _Bantuan_pageState extends State<Bantuan_page> {
  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
      widget: const Icon(Icons.list),
      headerItem: 'Daftar',
      discription: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("1. Masukkan data username yang ingin dibuat"),
          Text("2. Masukkan password dan confirmation password yang ingin dibuat"),
          Text("3. Masukkan data diri"),
          Text("4. Silakan Login ke aplikasi"),
        ],
      ),
    ),
    ItemModel(
      widget: const Icon(Icons.login),
      headerItem: 'Login',
      discription: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("1. Masukkan data username yang sudah dibuat"),
          Text("2. Masukkan password dan confirmation password yang sudah dibuat"),
        ],
      ),
    ),
    ItemModel(
      widget: const Icon(Icons.qr_code),
      headerItem: 'Scan QR',
      discription: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("1. Buka fitur Scan QR"),
          Text("2. Arahkan kamera pada kode QR yang disediakan oleh tempat"),
          Text("3. Maka secara otomatis Anda akan terdata di aplikasi"),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bantuan"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: itemData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: ExpansionPanelList(
                animationDuration: const Duration(milliseconds: 500),
                dividerColor: Colors.red,
                expandedHeaderPadding: const EdgeInsets.only(bottom: 0.0),
                elevation: 1,
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            itemData[index].widget,
                            const SizedBox(width: 8,),
                            Text(
                              itemData[index].headerItem,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    body: Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 20),
                      child: itemData[index].discription
                    ),
                    isExpanded: itemData[index].expanded,
                  )
                ],
                expansionCallback: (int item, bool status) {
                  setState(() {
                    itemData[index].expanded = !itemData[index].expanded;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ItemModel {
  bool expanded;
  Widget widget;
  String headerItem;
  Widget discription;

  ItemModel({
    this.expanded = false,
    required this.widget,
    required this.headerItem,
    required this.discription,
  });
}
