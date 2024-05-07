import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ttt/app/routes/app_pages.dart';

import '../controllers/title_page_controller.dart';

class TitlePageView extends GetView<TitlePageController> {
  const TitlePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games Lists'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.HOME);
              },
              child: const Text('TicTacToe'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.CHESS_PAGE);
              },
              child: const Text('Chess'),
            ),
          ],
        ),
      ),
    );
  }
}
