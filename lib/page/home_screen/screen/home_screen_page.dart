import 'package:prueba/export/export.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive? responsive = Responsive.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5), 
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //imagen logo
                buildImage(responsive!),
                //Texto
                buildText(responsive),
                //Boton inicar
                buildButton(responsive)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
