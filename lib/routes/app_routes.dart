import 'package:get/get.dart';
import 'package:prueba/page/home_screen/screen/home_screen_page.dart';
import 'package:prueba/page/list_screen/screen/list_screen_page.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';
  static const String listScreen = '/list_screen';
  static const String initialScreen = '/initial_routes';

  static List<GetPage> pages = [
    GetPage(name: initialScreen, page: () => const HomeScreenPage()),
    GetPage(name: homeScreen, page: () => const HomeScreenPage()),
    GetPage(name: listScreen, page: () => ListScreenPage())
  ];
}
