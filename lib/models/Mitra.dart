// ignore_for_file: file_names

class Mitra {
  Mitra({
    required this.idMitra,
    required this.namaMitra,
    required this.alamatMitra,
    required this.noHpMitra,
    required this.jenisUsaha,
    required this.deskripsi,
    required this.fotoUsaha,
    required this.status,
  });

  final int? idMitra;
  final String? namaMitra;
  final String? alamatMitra;
  final String? noHpMitra;
  final String? jenisUsaha;
  final String? deskripsi;
  final String? fotoUsaha;
  final String? status;

  factory Mitra.fromJson(Map<String, dynamic> json) {
    return Mitra(
      idMitra: json['data']['idMitra'],
      namaMitra: json['data']['namaMitra'],
      alamatMitra: json['data']['alamatMitra'],
      noHpMitra: json['data']['noHpMitra'],
      jenisUsaha: json['data']['jenisUsaha'],
      deskripsi: json['data']['deskripsi'],
      fotoUsaha: json['data']['fotoUsaha'],
      status: json['data']['status'],
    );
  }
}
