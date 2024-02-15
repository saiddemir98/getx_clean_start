import 'package:get/get.dart';

import '../page/home_page.dart';
import '../page/initial_page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const InitialPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    )
  ];
}
