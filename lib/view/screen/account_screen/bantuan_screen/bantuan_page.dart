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
      headerItem: 'Bantuan 1',
      discription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam finibus sagittis tincidunt. Pellentesque vel eleifend risus, non bibendum erat. Fusce aliquet congue risus at lobortis.",
    ),
    ItemModel(
      headerItem: 'Bantuan 2',
      discription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam finibus sagittis tincidunt. Pellentesque vel eleifend risus, non bibendum erat. Fusce aliquet congue risus at lobortis.",
    ),
    ItemModel(
      headerItem: 'Bantuan 3',
      discription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam finibus sagittis tincidunt. Pellentesque vel eleifend risus, non bibendum erat. Fusce aliquet congue risus at lobortis.",
    ),
    ItemModel(
      headerItem: 'Bantuan 4',
      discription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam finibus sagittis tincidunt. Pellentesque vel eleifend risus, non bibendum erat. Fusce aliquet congue risus at lobortis.",
    ),
    ItemModel(
      headerItem: 'Bantuan 4',
      discription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam finibus sagittis tincidunt. Pellentesque vel eleifend risus, non bibendum erat. Fusce aliquet congue risus at lobortis.",
    ),
    ItemModel(
      headerItem: 'Bantuan 4',
      discription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam finibus sagittis tincidunt. Pellentesque vel eleifend risus, non bibendum erat. Fusce aliquet congue risus at lobortis.",
    ),
    ItemModel(
      headerItem: 'Bantuan 4',
      discription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam finibus sagittis tincidunt. Pellentesque vel eleifend risus, non bibendum erat. Fusce aliquet congue risus at lobortis.",
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
                        child: Text(
                          itemData[index].headerItem,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    body: Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemData[index].discription,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
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
  String headerItem;
  String discription;

  ItemModel({
    this.expanded = false,
    required this.headerItem,
    required this.discription,
  });
}
