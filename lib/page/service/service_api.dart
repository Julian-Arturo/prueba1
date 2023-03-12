import 'package:prueba/api/api_photo.dart';
import 'package:prueba/export/export.dart';
import 'package:prueba/utils/api_response.dart';

class GetApi {
  final Http _http;

  GetApi(this._http);

  Future<HttpResponse<List<PhotoModel>>> getDataPhoto() {
    return _http.request(
      path: "https://jsonplaceholder.typicode.com/photos",
      parse: (data) => List<Map<String, dynamic>>.from(data)
          .map((u) => PhotoModel.fromJson(u))
          .toList(),
    );
  }
}
