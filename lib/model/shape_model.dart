class UserShop {
  final String status;
  List<Shop> data;

  UserShop({this.status = "no-status", this.data = const []});

  factory UserShop.fromJson(Map<String, dynamic> json) => UserShop(
      status: json["status"],
      data: List<Shop>.from(json["shop"].map((e) => Shop.fromJson(e))));
}

class Shop {
  final int id;
  final String nama;
  final String deskripsi;
  final int harga;
  final String gambar;

  Shop(
      {this.id = 0,
      this.nama = "no-name",
      this.deskripsi = "no-latin",
      this.harga = 0,
      this.gambar = "no-deskripsi"});
  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
      id: json["id"],
      nama: json["nama"],
      deskripsi: json["deskripsi"],
      harga: json["harga"],
      gambar: json["gambar"]);
}