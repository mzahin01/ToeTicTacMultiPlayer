import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttt/app/routes/app_pages.dart';
import '../controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Players List'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.users.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("You are not logged in"),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.LOG_IN_PAGE);
                  },
                  child: const Text('Log in'),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            var user = controller.users[index];
            return GestureDetector(
              child: Container(
                margin: const EdgeInsets.all(5),
                color: const Color.fromARGB(255, 118, 208, 249),
                width: Get.width,
                child: ListTile(
                  title: Text(user.name ?? '--'),
                  subtitle: Text(user.email ?? '--'),
                  trailing: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      (user.played ?? 0) <= 10
                          ? 'NewBie'
                          : user.played == 0
                              ? '${user.won.toString()}%'
                              : '${(user.won! * 100 / user.played!).toStringAsFixed(2)}%',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.TictactoeOnline, parameters: {
                  'opponent': controller.users[index].uid ?? '',
                  'mine': controller.user.value?.uid ?? '',
                });
              },
            );
          },
        );
      }),
    );
  }
}
