import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttt/app/routes/app_pages.dart';

import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  const MainPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.TITLE_PAGE);
              },
              child: const Text('LoginVerification'),
            ),
          ],
        ),
      ),
    );
  }
}
