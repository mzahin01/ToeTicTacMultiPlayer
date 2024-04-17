import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttt/app/modules/home/controllers/home_controller.dart';

class RestartButton extends StatelessWidget {
  const RestartButton({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.initializeGame();
      },
      child: const Text("Restart Game"),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Toe Tic Tac',
          style: TextStyle(
            color: Color.fromARGB(255, 3, 80, 6),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Obx(
          () => Text(
            "${controller.currentPlayer.value}'s Turn", // Display the current player's turn
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class GameContainer extends StatelessWidget {
  const GameContainer({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      width: Get.height / 2,
      margin: const EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 9,
        itemBuilder: (context, int index) {
          return Box(controller: controller, index: index);
        },
      ),
    );
  }
}

class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.controller,
    required this.index,
  });

  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          if (controller.gameEnd.value |
              controller.occupied[index].isNotEmpty) {
            return;
          }
          controller.logic(index);
        },
        child: Container(
          color: controller.occupied[index].isEmpty
              ? Colors.black26
              : controller.occupied[index] == controller.PLAYER_X.value
                  ? Colors.red
                  : Colors.amber,
          margin: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            controller.occupied[index],
            style: const TextStyle(fontSize: 50),
          )),
        ),
      ),
    );
  }
}
