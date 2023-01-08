import 'package:flutter/material.dart';
import 'package:apotek/api/api_service.dart';
import 'package:apotek/model/obat.dart';
import 'package:apotek/model/obatread.dart';
import 'package:apotek/screen/obat_create.dart';

class ObatList extends StatefulWidget {
  static const routeName = '/obat_list';

  const ObatList({Key? key}) : super(key: key);

  @override
  State<ObatList> createState() => _ObatListState();
}

class _ObatListState extends State<ObatList> {
  late Future<ObatRead> _future;

  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    _future = apiService.getObat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membaca API Online'),
      ),
      body: Center(
        child: FutureBuilder<ObatRead>(
          future: _future,
          builder: (context, snapshot) {
            var state = snapshot.connectionState;
            if (state != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                final List<Obat> obats = snapshot.data!.obats;
                return ListView.builder(
                    itemCount: obats.length,
                    itemBuilder: (context, index) {
                      return _buildObatCard(context, obats[index]);
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else {
                return const Text('');
              }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, ObatCreate.routeName);
        },
      ),
    );
  }

  Widget _buildObatCard(BuildContext context, Obat obat) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        obat.nama,
      ),
    );
  }
}
