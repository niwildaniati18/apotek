class Pembeli {
  int idPembeli;
  String namaPembeli;
  int umur;

  Pembeli({
    required this.idPembeli,
    required this.namaPembeli,
    required this.umur,
  });

  factory Pembeli.fromJson(Map<String, dynamic> pembeli) => Pembeli(
        idPembeli: pembeli['id_pembeli'],
        namaPembeli: pembeli['nama_pembeli'],
        umur: pembeli['umur'],
      );

  Map<String, dynamic> toJson() {
    var data = {
      'id_pembeli': idPembeli,
      'nama_pembeli': namaPembeli,
      'umur': umur,
    };
    return data;
  }
}
