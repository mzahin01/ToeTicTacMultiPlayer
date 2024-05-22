import 'package:get/get.dart';

import '../modules/log_in_page/bindings/log_in_page_binding.dart';
import '../modules/log_in_page/views/log_in_page_view.dart';
import '../modules/main_page/bindings/main_page_binding.dart';
import '../modules/main_page/views/main_page_view.dart';
import '../modules/registration_page/bindings/registration_page_binding.dart';
import '../modules/registration_page/views/registration_page_view.dart';
import '../modules/tictactoe_offline/bindings/tictactoe_offline_binding.dart';
import '../modules/tictactoe_offline/views/tictactoe_offline_view.dart';
import '../modules/tictactoe_online/bindings/tictactoe_online_binding.dart';
import '../modules/tictactoe_online/views/tictactoe_online_view.dart';
import '../modules/user_list/bindings/user_list_binding.dart';
import '../modules/user_list/views/user_list_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.TictactoeOnline,
      page: () => const TictactoeOnlineView(),
      binding: TictactoeOnlineBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => const MainPageView(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION_PAGE,
      page: () => const RegistrationPageView(),
      binding: RegistrationPageBinding(),
    ),
    GetPage(
      name: _Paths.USER_LIST,
      page: () => const UserListView(),
      binding: UserListBinding(),
    ),
    GetPage(
      name: _Paths.LOG_IN_PAGE,
      page: () => const LogInPageView(),
      binding: LogInPageBinding(),
    ),
    GetPage(
      name: _Paths.TICTACTOE_OFFLINE,
      page: () => const TictactoeOfflineView(),
      binding: TictactoeOfflineBinding(),
    ),
  ];
}
