import 'package:prueba/api/api_photo.dart';
import 'package:prueba/page/service/service_api.dart';

import '../export/export.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Http http = Http();

    final GetApi response = GetApi(http);
    Get.put(response);
  }
}
