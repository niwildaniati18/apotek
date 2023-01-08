class Obat {
  String id;
  String nama;

  Obat({required this.id, required this.nama});

  factory Obat.fromJson(Map<String, dynamic> obat) =>
      Obat(id: obat['id'], nama: obat['nama']);
}
