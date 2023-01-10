class Pembeli {
  int umur;
  String namaPembeli;
  int obatId;

  Pembeli({
    required this.umur,
    required this.namaPembeli,
    required this.obatId,
  });

  factory Pembeli.fromJson(Map<String, dynamic> pembeli) => Pembeli(
        umur: pembeli['umur'],
        namaPembeli: pembeli['nama_pembeli'],
        obatId: pembeli['obat_id'],
      );

  Map<String, dynamic> toJson() {
    var data = {
      'umur': umur,
      'nama_pembeli': namaPembeli,
      "obat_id": obatId,
    };
    return data;
  }
}
