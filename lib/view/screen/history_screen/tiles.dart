import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tiles extends StatelessWidget {
  final String _namaTempat;
  final String _alamat;
  final String _tanggalKunjungan;

  const Tiles(this._namaTempat, this._alamat, this._tanggalKunjungan,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _namaTempat,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                SizedBox(
                  width: 200,
                  child: Text(
                    _alamat,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _tanggalKunjungan,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
