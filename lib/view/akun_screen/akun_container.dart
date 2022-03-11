import 'package:covid_go_cek_in/constant/constant.dart';
import 'package:flutter/material.dart';
import 'akun_setting.dart';
import '../history_screen/history_page.dart';
import 'tiles_account_setting.dart';

class AkunContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: _buildContent(context),
    );
  }
}

Widget _buildContent(BuildContext context) {
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: lightGreenColor,
        child: Column(
          children: [
            SizedBox(height: 100,),
            Center(
              child: Column(
                children: [
                  Image.asset('assets/img/avatar/avatar_1.png'),
                  SizedBox(height: 11,),
                  Text(
                    'Ganti Avatar',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: mainColor
                    ),
                  ),
                  SizedBox(height: 11,),
                  Text('Gilang Gumelar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text('11451923344275628849',
                    style: TextStyle(
                      color: textColor
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40)
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          TilesAccountSetting('assets/img/person.png', 'Nama', 'Gilang Gumelar'),
                          SizedBox(height: 30,),
                          TilesAccountSetting('assets/img/person.png', 'E-Mail', 'gilanggumelar@gmail.com'),
                          SizedBox(height: 30,),
                          TilesAccountSetting('assets/img/person.png', 'Nomor Telepon', '+62 8884 2422 2222'),
                          SizedBox(height: 30,),
                          TilesAccountSetting('assets/img/person.png', 'Alamat', 'Jl. Ki Joko Bodo, RT.69, RW.3...'),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ]
        ),
      ));
}
