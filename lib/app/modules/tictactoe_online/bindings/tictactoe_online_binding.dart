import 'package:get/get.dart';

import '../controllers/tictactoe_online_controller.dart';

class TictactoeOnlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TictactoeOnlineController>(
      TictactoeOnlineController(),
    );
  }
}
