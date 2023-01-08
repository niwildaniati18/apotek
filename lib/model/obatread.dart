import 'package:apotek/model/obat.dart';

class ObatRead {
  ObatRead({required this.success, required this.obats});

  bool success;
  List<Obat> obats;

  factory ObatRead.fromJson(Map<String, dynamic> json) => ObatRead(
      success: json['success'],
      obats: List<Obat>.from(json['data'].map((x) => Obat.fromJson(x))));
}
