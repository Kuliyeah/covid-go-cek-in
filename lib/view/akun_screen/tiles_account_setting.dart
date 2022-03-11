import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:flutter/material.dart';

class TilesAccountSetting extends StatelessWidget {
  final String? settingImg;
  final String? title;
  final String? name;
  TilesAccountSetting(this.settingImg, this.title, this.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      children : [
        Row(
          children: [
            Image.asset('$settingImg'),
            SizedBox(width:28,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: textColor
                  ),
                ),
                Text(
                  '$name',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor
                  ),
                )
              ],
            ),
            Spacer(),
            Icon(Icons.edit, color: textColor.withOpacity(0.4),),
          ],
        ),
      ],
    );
  }
}