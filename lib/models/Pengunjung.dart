// ignore_for_file: file_names

class Pengunjung {
  Pengunjung({
    required this.idPengunjung,
    required this.usernamePengunjung,
    required this.passwordPengunjung,
    required this.namaPengunjung,
    required this.alamatPengunjung,
    required this.noHpPengunjung,
    required this.umurPengunjung,
    required this.jenisKelaminPengunjung,
    required this.statusKesehatan,
  });

  final int? idPengunjung;
  final String? usernamePengunjung;
  final String? passwordPengunjung;
  final String? namaPengunjung;
  final String? alamatPengunjung;
  final String? noHpPengunjung;
  final int? umurPengunjung;
  final String? jenisKelaminPengunjung;
  final String? statusKesehatan;

  factory Pengunjung.fromJson(Map<String, dynamic> json) {
    return Pengunjung(
      idPengunjung: json['data']['idPengunjung'],
      usernamePengunjung: json['data']['usernamePengunjung'],
      passwordPengunjung: json['data']['passwordPengunjung'],
      namaPengunjung: json['data']['namaPengunjung'],
      alamatPengunjung: json['data']['alamatPengunjung'],
      noHpPengunjung: json['data']['noHpPengunjung'],
      umurPengunjung: json['data']['umurPengunjung'],
      jenisKelaminPengunjung: json['data']['jenisKelaminPengunjung'],
      statusKesehatan: json['data']['statusKesehatan'],
    );
  }
}
