import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ttt/app/modules/tictactoe_offline/widget/tictactoe_offline_widgets.dart';
import '../controllers/tictactoe_offline_controller.dart';

class TictactoeOfflineView extends GetView<TictactoeOfflineController> {
  const TictactoeOfflineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderText(controller: controller),
              GameContainer(controller: controller),
              RestartButton(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
