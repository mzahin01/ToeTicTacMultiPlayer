import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chess_page_controller.dart';

class ChessPageView extends GetView<ChessPageController> {
  const ChessPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChessPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChessPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
