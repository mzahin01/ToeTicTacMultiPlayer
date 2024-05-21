import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ttt/app/modules/tictactoe_online/widget/tictactoe_online_widgets.dart';
import '../controllers/tictactoe_online_controller.dart';

class TictactoeOnlineView extends GetView<TictactoeOnlineController> {
  const TictactoeOnlineView({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RestartButton(controller: controller),
                  FirstPlayerButton(controller: controller),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
