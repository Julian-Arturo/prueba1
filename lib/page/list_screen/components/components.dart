import 'package:prueba/export/export.dart';
import 'package:prueba/page/list_screen/controller/list_controller_controller.dart';
//componente para alerta notificacion
void showSnackBar(String title, String message, Color backgroundColor,
    Color colorText, EdgeInsets? margin) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    colorText: colorText,
    margin: const EdgeInsets.all(20),
  );
}
//componente de appBar pagina de lista
Container appBar(Responsive? responsive) {
  return Container(
    width: responsive!.width(100),
    height: responsive.width(25),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      color: Color(0xff185BFF),
    ),
    child: Stack(
      children: [
        Positioned(
          top: -50,
          right: -20,
          child: Image.asset(
            'assets/images/img_frame_white_a700.png',
            width: responsive.width(50),
            height: responsive.height(20),
          ),
        ),
        Center(
          child: Text(
            'Lista de elementos',
            style: AppStyle.buttonTextStyle,
          ),
        ),
      ],
    ),
  );
}
//Coponente de mensaje pagina de lista
Container messageError(
    BuildContext context, Responsive responsive, ListController controller) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white60, borderRadius: BorderRadius.circular(20)),
    width: responsive.width(70),
    height: responsive.width(25),
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Ups! Algo salio mal.",
          style: AppStyle.titleTextStyle,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.error.value = false;
                  controller.isLoadingCircular.value = false;
                  controller.getData();
                },
                child: const Text(
                  "Volver a cargar",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Retroceder"),
              ),
            ],
          ),
        )
      ],
    )),
  );
}
