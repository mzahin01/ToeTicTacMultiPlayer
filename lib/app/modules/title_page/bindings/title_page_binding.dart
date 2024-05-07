import 'package:get/get.dart';

import '../controllers/title_page_controller.dart';

class TitlePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TitlePageController>(
      () => TitlePageController(),
    );
  }
}
