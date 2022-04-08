import 'package:flutter/material.dart';
import '../../../../constant/constant.dart';

class VisitorPage extends StatelessWidget {
  // final List<Users> cases;
  VisitorPage({Key? key}) : super(key: key);

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
                  children: [
                    Text(
                      "ABATA COFFEE",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                    Text("Jl. in aja dulu, Gg. Cocok yaudah")
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(
              height: 36,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pengujung",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    Text("3 Maret 2021")
                  ],
                ),
                Spacer(),
                Text(
                  "9/30",
                  style: TextStyle(
                      color: mainColor, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Visitors("abasdasds", "09:30"),
                Spacer(),
                Visitors("abasdasds", "09:30"),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Visitors("abasdasds", "09:30"),
                Spacer(),
                Visitors("abasdasds", "09:30"),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Visitors("abasdasds", "09:30"),
                Spacer(),
                Visitors("abasdasds", "09:30"),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Visitors("abasdasds", "09:30"),
                Spacer(),
                Visitors("abasdasds", "09:30"),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Visitors("abasdasds", "09:30"),
                Spacer(),
                Visitors("abasdasds", "09:30"),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Visitors("abasdasds", "09:30"),
                Spacer(),
                Visitors("abasdasds", "09:30"),
              ],
            ),
            SizedBox(height: 8,),
          ],
        ),
      ),
    ),
  );
}

class Visitors extends StatelessWidget {
  String nama;
  String jam;
  Visitors(this.nama, this.jam);

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
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama, style: TextStyle(fontWeight: FontWeight.bold),),
                Text(jam),
              ],
            )
          ],
        ),
      ),
    );
  }
}
