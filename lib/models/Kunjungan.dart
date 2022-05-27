// ignore_for_file: file_names

int i = 0;
int count = 0;

class Kunjungan {
  Kunjungan({
    required this.namaMitra,
    required this.alamatMitra,
    required this.tanggal,
    required this.numRow,
  });

  final String? namaMitra;
  final String? alamatMitra;
  final String? tanggal;
  final int? numRow;

  factory Kunjungan.fromJson(Map<String, dynamic> json) {
    count = json['data'][i]['num_row'];
    i++;
    return Kunjungan(
      namaMitra: json['data'][count]['namaMitra'],
      alamatMitra: json['data'][count]['alamatMitra'],
      tanggal: json['data'][count]['tanggal'],
      numRow: json['data'][count]['num_row'] + 1,
    );
  }
}
