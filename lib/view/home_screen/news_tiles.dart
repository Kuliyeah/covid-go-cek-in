import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsTiles extends StatelessWidget {
  String _description;
  String _imgUrl;
  String _title;

  NewsTiles(this._imgUrl, this._title, this._description);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 84,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: Color(0xFFFDB8B8),
              ),
              child: Image(image: AssetImage('assets/img/virus.png')),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _title,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    _description,
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF888888),
                    ),
                    softWrap: true,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
