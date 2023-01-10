import 'package:flutter/material.dart';
import 'package:apotek/api/api_service.dart';
import 'package:apotek/model/pembeli.dart';

class ObatCreate extends StatefulWidget {
  static const routeName = '/obat_create';
  const ObatCreate({Key? key}) : super(key: key);

  @override
  State<ObatCreate> createState() => _ObatCreateState();
}

class _ObatCreateState extends State<ObatCreate> {
  String _nama = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Input Data'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Tuliskan Obat Baru',
                  labelText: 'Input Obat',
                ),
                onChanged: (String value) {
                  setState(() {
                    _nama = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  ApiService apiService = ApiService();
                  apiService.createObat(_nama);

                  Pembeli pembeli =
                      Pembeli(umur: 20, namaPembeli: 'Nandra', obatId: 2);
                  apiService.createPembeli(pembeli);
                },
              )
            ],
          ),
        ));
  }
}
