import 'package:flutter/material.dart';
import 'package:covid_go_cek_in/constant/constant.dart';

class TilesAccountSetting extends StatelessWidget {
  final IconData? settingImg;
  final String? title;
  final String? name;
  const TilesAccountSetting(this.settingImg, this.title, this.name, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Icon(
              settingImg,
              color: Colors.green,
              size: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$title',
                    style: TextStyle(
                      fontSize: 15,
                      color: textColor,
                    ),
                  ),
                  _buildMargin(5),
                  SizedBox(
                    width: 225,
                    child: Text(
                      '$name',
                      style: TextStyle(
                        fontSize: 15,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            if ('$title' != "Username")
              GestureDetector(
                child: const Icon(
                  Icons.edit,
                  color: Colors.black54,
                  size: 25,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('$title'),
                        content: DetailKasus(data: '$name', field: '$title'),
                      );
                    },
                  );
                },
              ),
          ],
        ),
      ],
    );
  }
}

Widget _buildMargin(double n) {
  return SizedBox(
    height: n,
  );
}

class DetailKasus extends StatefulWidget {
  final String data, field;

  const DetailKasus({Key? key, required this.data, required this.field})
      : super(key: key);

  @override
  DetailKasusState createState() => DetailKasusState();
}

class DetailKasusState extends State<DetailKasus> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.0,
      width: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextFormField(
            initialValue: widget.data,
            decoration: InputDecoration(
              hintText: "Ketik " + widget.field + " baru",
              hintStyle: const TextStyle(fontSize: 15, color: Colors.black45),
            ),
          ),
          _buildMargin(20),
          ButtonTheme(
            minWidth: 100.0,
            height: 35,
            // ignore: deprecated_member_use
            child: RaisedButton(
              child: const Text("Perbarui"),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
