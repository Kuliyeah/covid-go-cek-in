import 'package:flutter/material.dart';

class Term_Of_Service_Page extends StatefulWidget {
  Term_Of_Service_Page({Key? key}) : super(key: key);

  @override
  State<Term_Of_Service_Page> createState() => _Term_Of_Service_pageState();
}

class _Term_Of_Service_pageState extends State<Term_Of_Service_Page> {
  List<ItemModel> itemData = <ItemModel>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Term Of Service"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: itemData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 500),
                dividerColor: Colors.red,
                expandedHeaderPadding: EdgeInsets.only(bottom: 0.0),
                elevation: 1,
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          itemData[index].headerItem,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    body: Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
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
    this.expanded: false,
    required this.headerItem,
    required this.discription,
  });
}
