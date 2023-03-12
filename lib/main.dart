import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/routes/app_routes.dart';
import 'package:prueba/utils/initial_bindings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialScreen,
      getPages: AppRoutes.pages,
    );
  }
}
