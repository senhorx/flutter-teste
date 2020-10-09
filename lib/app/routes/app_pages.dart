import 'package:get/route_manager.dart';
import 'package:teste_app/app/routes/app_routes.dart';
import 'package:teste_app/app/ui/android/group_page.dart';
import 'package:teste_app/app/ui/android/home_page.dart';
import 'package:teste_app/app/ui/android/initial_page.dart';
import 'package:teste_app/app/ui/android/operation_page.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => InitialPage()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.GROUP, page: () => GroupPage()),
    GetPage(name: Routes.OPERATION, page: () => OperationPage()),
  ];
}
