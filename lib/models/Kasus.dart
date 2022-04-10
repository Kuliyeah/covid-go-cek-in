// ignore_for_file: file_names

class Kasus {
  Kasus(
      {required this.confirmeds,
      required this.recovereds,
      required this.deaths});

  final int? confirmeds;
  final int? recovereds;
  final int? deaths;

  factory Kasus.fromJson(Map<String, dynamic> json) {
    return Kasus(
        confirmeds: json['confirmed']['value'],
        recovereds: 5801909,
        deaths: json['deaths']['value']);
  }
}
