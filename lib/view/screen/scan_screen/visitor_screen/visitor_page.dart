import 'package:flutter/material.dart';
import '../../../../constant/constant.dart';

class VisitorPage extends StatelessWidget {
  // final List<Users> cases;
  const VisitorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreenColor,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
    );
  }
}

Widget _buildContent(BuildContext context) {
  return SafeArea(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "ABATA COFFEE",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                    Text("Jl. in aja dulu, Gg. Cocok yaudah")
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Pengujung",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    Text("3 Maret 2021")
                  ],
                ),
                const Spacer(),
                Text(
                  "9/30",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Visitors("abasdasds", "09:30"),
                const Spacer(),
                Visitors("abasdasds", "09:30"),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Visitors("abasdasds", "09:30"),
                const Spacer(),
                Visitors("abasdasds", "09:30"),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Visitors("abasdasds", "09:30"),
                const Spacer(),
                Visitors("abasdasds", "09:30"),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Visitors("abasdasds", "09:30"),
                const Spacer(),
                Visitors("abasdasds", "09:30"),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Visitors("abasdasds", "09:30"),
                const Spacer(),
                Visitors("abasdasds", "09:30"),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Visitors("abasdasds", "09:30"),
                const Spacer(),
                Visitors("abasdasds", "09:30"),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    ),
  );
}

// ignore: must_be_immutable
class Visitors extends StatelessWidget {
  String nama;
  String jam;
  Visitors(this.nama, this.jam, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: mainColor, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              'assets/img/avatar/avatar_1.png',
              width: 70,
              height: 70,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(jam),
              ],
            )
          ],
        ),
      ),
    );
  }
}
