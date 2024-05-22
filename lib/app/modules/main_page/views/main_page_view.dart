import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttt/app/routes/app_pages.dart';
import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  const MainPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        floatingActionButton: controller.user.value != null
            ? FloatingActionButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Icon(Icons.logout),
              )
            : null,
        appBar: AppBar(
          title: const Text('Hello'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      child: Container(
                        color: Colors.lightBlueAccent,
                        height: Get.height / 6,
                        width: Get.width,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                  Get.toNamed(Routes.USER_LIST,
                                      arguments: controller.username.value);
                                },
                                child: const Text('Online'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                  Get.toNamed(Routes.TICTACTOE_OFFLINE);
                                },
                                child: const Text('Offline'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: const Text('toeTicTac'),
              ),
              const SizedBox(
                height: 200,
              ),
              if (controller.user.value == null) ...[
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.LOG_IN_PAGE);
                  },
                  child: const Text('Log in'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTRATION_PAGE);
                  },
                  child: const Text('Register Now'),
                ),
              ] else
                Text(
                  'Salam,\n ${controller.username.value ?? 'No name found'}',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
