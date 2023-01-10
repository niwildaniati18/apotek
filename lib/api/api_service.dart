import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:apotek/model/obatread.dart';
import 'package:apotek/model/pembeli.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1/Apotek_api/api/';
  Future<ObatRead> getObat() async {
    final response = await http.get(Uri.parse("${baseUrl}obat/read.php"));
    if (response.statusCode == 200) {
      return ObatRead.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<http.Response> createObat(String nama) async {
    final response = await http.post(
      Uri.parse("${baseUrl}obat/create.php"),
      body: jsonEncode(<String, String>{
        'nama': nama,
      }),
    );
    return response;
  }

  Future<http.Response> createPembeli(Pembeli pembeli) async {
    final response = await http.post(
      Uri.parse("${baseUrl}pembeli/create.php"),
      body: jsonEncode(pembeli.toJson()),
    );
    return response;
  }
}
