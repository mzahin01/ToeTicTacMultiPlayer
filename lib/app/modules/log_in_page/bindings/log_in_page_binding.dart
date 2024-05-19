import 'package:get/get.dart';

import '../controllers/log_in_page_controller.dart';

class LogInPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogInPageController>(
      () => LogInPageController(),
    );
  }
}
