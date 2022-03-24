import 'package:flutter/material.dart';

class Tiles extends StatelessWidget {
  String _namaTempat;
  String _alamat;
  String _tanggalKunjungan;
  String _jamKunjungan;

  Tiles(this._namaTempat, this._alamat, this._tanggalKunjungan,
      this._jamKunjungan);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _namaTempat,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  _alamat,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _tanggalKunjungan,
                  style: TextStyle(fontSize: 14),
                ),
                Spacer(),
                Text(
                  _jamKunjungan,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
