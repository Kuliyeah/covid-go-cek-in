// ignore_for_file: file_names

int i = 0;
int count = 0;

class Kunjungan {
  Kunjungan({
    required this.namaMitra,
    required this.alamatMitra,
    required this.tanggal,
    required this.num_row,
  });

  final String? namaMitra;
  final String? alamatMitra;
  final String? tanggal;
  final int? num_row;

  factory Kunjungan.fromJson(Map<String, dynamic> json) {
    // ignore: unused_local_variable
    count = json['data'][i]['num_row'];
    i++;
    return Kunjungan(
      namaMitra: json['data'][count]['namaMitra'],
      alamatMitra: json['data'][count]['alamatMitra'],
      tanggal: json['data'][count]['tanggal'],
      num_row: json['data'][count]['num_row'] + 1,
    );
  }
}
