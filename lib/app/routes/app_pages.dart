import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main_page/bindings/main_page_binding.dart';
import '../modules/main_page/views/main_page_view.dart';
import '../modules/title_page/bindings/title_page_binding.dart';
import '../modules/title_page/views/title_page_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => const MainPageView(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: _Paths.TITLE_PAGE,
      page: () => const TitlePageView(),
      binding: TitlePageBinding(),
    ),
  ];
}
