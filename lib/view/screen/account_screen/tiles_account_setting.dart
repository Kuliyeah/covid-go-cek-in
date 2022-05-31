import 'package:covid_go_cek_in/helperurl.dart';
import 'package:covid_go_cek_in/view/login_screen/login_page.dart';
import 'package:covid_go_cek_in/view/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid_go_cek_in/constant/constant.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

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
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = widget.data;
  }

  Future updateData(String field, String data) async {
    String url = MyUrl().getUrl();
    await http.put(
      "$url/v1/pengunjung/$data/" + logindata.getString('username').toString(),
      body: {
        field: textController.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.0,
      width: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextFormField(
            controller: textController,
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
              onPressed: () async {
                if (widget.field == "Nama") {
                  updateData("namaPengunjung", "editnama");
                } else if (widget.field == "Alamat") {
                  updateData("alamatPengunjung", "editalamat");
                } else {
                  updateData("noHpPengunjung", "edittelp");
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Data berhasil diperbarui"),
                    duration: Duration(milliseconds: 1000),
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MainScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
