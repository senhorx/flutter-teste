import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:teste_app/app/routes/app_pages.dart';
import 'package:teste_app/app/routes/app_routes.dart';
import 'package:teste_app/app/ui/theme/app_theme.dart';

void main() async {
  runApp(GetMaterialApp(
    title: "Teste da Digistarts",
    debugShowCheckedModeBanner: false,
    getPages: AppPages.routes,
    initialRoute: Routes.INITIAL,
    theme: appThemeData,
  ));
}
