import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ttt/app/routes/app_pages.dart';

import '../../home/views/home_view.dart';
import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  const MainPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainPageView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.TITLE_PAGE);
              },
              child: const Text('LoginVerification\nIsToBeImplementedHere'),
            ),
          ),
        ],
      ),
    );
  }
}
