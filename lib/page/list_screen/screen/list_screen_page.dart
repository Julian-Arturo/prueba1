import 'package:prueba/export/export.dart';
import 'package:prueba/page/list_screen/components/components.dart';
import 'package:prueba/page/list_screen/controller/list_controller_controller.dart';
import 'package:prueba/page/list_screen/widgets/list_photo.dart';

class ListScreenPage extends StatelessWidget {
  ListScreenPage({Key? key}) : super(key: key);
  final controller = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    Responsive? responsive = Responsive.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        body: Stack(
          children: [
            //Listas
            ListPhoto(
              responsive: responsive,
              controller: controller,
            ),
            //Appbar
            appBar(responsive),
          ],
        ),
      ),
    );
  }
}
