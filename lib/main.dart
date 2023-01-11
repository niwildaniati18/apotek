import 'package:flutter/material.dart';
import 'package:apotek/screen/obat_create.dart';
import 'package:apotek/screen/obat_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apotek',
      initialRoute: ObatList.routeName,
      routes: {
        ObatList.routeName: (context) => const ObatList(),
        ObatCreate.routeName: (context) => const ObatCreate(),
      },
    );
  }
}
