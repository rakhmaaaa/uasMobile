import 'package:http/http.dart' as http;

class RestAPIService {
  Future<bool> addShopService(
      int id, String nama, String deskripsi, int harga, String gambar) async {
    try {
      final Map<String, dynamic> map = {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "harga": harga,
        "gambar": gambar
      };
      http.Response response = await http
          .post(Uri.parse("https://e85a-103-166-147-253.ngrok-free.app"));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
