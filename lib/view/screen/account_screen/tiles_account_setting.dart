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
                  Text(
                    '$name',
                    style: TextStyle(
                      fontSize: 15,
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.edit,
              color: Colors.black54,
              size: 25,
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
