import 'package:prueba/export/export.dart';

Widget buildImage(Responsive responsive) {
  return Container(
    margin: EdgeInsets.only(top: responsive.height(8)),
    width: responsive.width(100),
    height: responsive.height(40),
    child: Image.asset(
      'assets/images/img_logo1.png',
      fit: BoxFit.cover,
    ),
  );
}

Widget buildText(Responsive responsive) {
  return SizedBox(
    width: responsive.width(100),
    height: responsive.height(25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: responsive.width(60),
            height: responsive.height(7),
            child: Text(
              'DESCUBRE LAS SIGUIENTES LISTA DE ELEMENTOS',
              textAlign: TextAlign.center,
              style: AppStyle.titleTextStyle,
            )),
        SizedBox(
          width: responsive.width(60),
          child: Text(
              'Esta app esta diseñada para consumir datos mediante un servicio y mostrarlos en una lista con sus respectivos elementos',
              textAlign: TextAlign.center,
              style: AppStyle.subTitleTextStyle),
        ),
      ],
    ),
  );
}

Widget buildButton(Responsive responsive) {
  return GestureDetector(
    onTap: () => Get.toNamed(AppRoutes.listScreen),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff185BFF),
      ),
      width: responsive.width(30),
      height: responsive.height(6),
      child: Center(child: Text('Iniciar', style: AppStyle.buttonTextStyle)),
    ),
  );
}
