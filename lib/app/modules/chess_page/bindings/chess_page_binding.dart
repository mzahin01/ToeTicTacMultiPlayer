import 'package:get/get.dart';

import '../controllers/chess_page_controller.dart';

class ChessPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChessPageController>(
      () => ChessPageController(),
    );
  }
}
