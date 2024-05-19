import 'package:get/get.dart';

import '../controllers/tictactoe_offline_controller.dart';

class TictactoeOfflineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TictactoeOfflineController>(
      () => TictactoeOfflineController(),
    );
  }
}
