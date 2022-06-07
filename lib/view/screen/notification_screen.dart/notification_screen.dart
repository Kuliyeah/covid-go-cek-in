import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:covid_go_cek_in/view/screen/history_screen/history_page.dart';

RemoteNotification? notification;

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: AlertDialog(
      title: Column(
        children: [
          const Icon(
            Icons.warning,
            color: Colors.red,
          ),
          Text(
            notification!.title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Column(
        children: [
          const Text(
            "Yang anda kunjungi pada tanggal : ",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            notification!.body!,
            style: const TextStyle(fontSize: 12),
          ),
          const Text(
            "TERDAPAT ORANG YANG",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            "TERINVEKSI COVID-19",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: dangerColor),
          ),
          const Text(
            "Segera periksakan dirimu ke \n Pusat kesehatan terdekat",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: (() => const HistoryPage()),
            child: Text(
              "Cek Historimu",
              style: TextStyle(color: dangerColor, fontSize: 14),
            ))
      ],
    ));
  }
}
