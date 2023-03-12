import 'package:prueba/page/list_screen/components/components.dart';
import 'package:prueba/page/service/service_api.dart';

import '../../../export/export.dart';

class ListController extends GetxController {
  final api = Get.find<GetApi>();
  var photos = <PhotoModel>[].obs;
  var error = false.obs;
  var currentMax = 10.obs;
  final isLoadingCircular = false.obs; //Circular progres indicator in general
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getData();
    super.onInit();
    scrollController.addListener(_onScrollEnd);
  }

  void _onScrollEnd() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _loadMorePhotos();
    }
  }
//Se traen los datos para ser trabajados
  Future<void> getData() async {
    try {
      var response = await api.getDataPhoto();
      isLoadingCircular.value = true;
      if (response.error != null) {
        error.value = true;
        showSnackBar('Error', response.error!.message.toString(), Colors.red,
            Colors.black, const EdgeInsets.only(top: 20));

        return;
      }
      //se agregan datos a la lista y se limita a los 10 elementos
      photos.value = [...?response.data];
      photos.value = photos.take(currentMax.value).toList();
      // Solo 10 primeras fotos
      update();
    } catch (e) {
      // Mostrar una alerta con el mensaje de erro
      showSnackBar('Error', 'No se pudo cargar la lista de fotos', Colors.red,
          Colors.black, const EdgeInsets.only(top: 20));
    }
  }

  Future<void> _loadMorePhotos() async {
    final newMax = currentMax.value + 10;
    if (newMax >= photos.length) {
      try {
        final response = await api.getDataPhoto();
        if (response.data!.isNotEmpty) {
          photos.value = response.data!;
          photos.value = photos.take(newMax).toList();
          currentMax.value = newMax;
        }
      } catch (e) {
        showSnackBar('Error', 'No se pudo cargar más fotos', Colors.red,
            Colors.black, const EdgeInsets.only(top: 20));
      }
    }
  }
}
