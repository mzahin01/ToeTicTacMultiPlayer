import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  const UserListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UserListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
