import 'package:flutter/material.dart';

class Term_Of_Service_Page extends StatefulWidget {
  Term_Of_Service_Page({Key? key}) : super(key: key);

  @override
  State<Term_Of_Service_Page> createState() => _Term_Of_Service_pageState();
}

class _Term_Of_Service_pageState extends State<Term_Of_Service_Page> {
  List<ItemModel> itemData = <ItemModel>[];
  @override
  
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
