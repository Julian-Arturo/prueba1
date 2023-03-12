import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:prueba/export/export.dart';
import 'package:prueba/utils/api_response.dart';

class Http {
  Future<HttpResponse<T>> request<T>({
    required String path,
    String method = "GET",
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, String>? header,
    T Function(dynamic data)? parse,
    dynamic formData,
  }) async {
    try {
      final uri = Uri.parse(path).replace(queryParameters: queryParameters);
      final response = await http.get(uri).timeout(const Duration(seconds: 5));
      const Center(child: CircularProgressIndicator());
      //Verificar status code
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (parse != null) {
          return HttpResponse.succes<T>(parse(decoded));
        }
        return HttpResponse.succes<T>(decoded);
      } else {
        throw Exception(
            'Error al realizar la petición: ${response.statusCode}');
      }
    } on TimeoutException {
      int? statusCode = -1;
      String? message = "Error de conexión";

      return HttpResponse.failed(
        statusCode: statusCode,
        message: message,
        data: null,
      );
    } catch (e) {
      //Errores de la peticion
      int? statusCode = 0;
      String? message;

      if (e is http.ClientException) {
        statusCode = -1;
        message = e.message;
        data = null;
      } else {
        message = "Error desconocido";
      }

      return HttpResponse.failed(
        statusCode: statusCode,
        message: message,
        data: data,
      );
    }
  }
}
