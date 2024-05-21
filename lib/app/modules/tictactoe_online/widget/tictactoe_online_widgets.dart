import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttt/app/modules/tictactoe_online/controllers/tictactoe_online_controller.dart';

class FirstPlayerButton extends StatelessWidget {
  const FirstPlayerButton({
    super.key,
    required this.controller,
  });

  final TictactoeOnlineController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              controller.gameData.value?.currentPlayer == 'Nobody'
                  ? Colors.white
                  : Colors.black),
        ),
        onPressed: () {
          if (controller.gameData.value?.currentPlayer == 'Nobody') {
            controller.gameStart();
            // controller.onlineTurn();
          } else {
            return;
          }
        },
        child: Text(
          controller.gameData.value?.currentPlayer == 'Nobody'
              ? "Play"
              : "Started",
          style: TextStyle(
              color: controller.gameData.value?.currentPlayer == 'Nobody'
                  ? Colors.black
                  : Colors.white),
        ),
      );
    });
  }
}

class RestartButton extends StatelessWidget {
  const RestartButton({
    super.key,
    required this.controller,
  });
  final TictactoeOnlineController controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.initializeGame(
          controller.gameData.value?.player1Uid ?? '',
          controller.gameData.value?.player2Uid ?? '',
        );
      },
      child: const Text("Do Restart Game"),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.controller,
  });

  final TictactoeOnlineController controller;

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
            "${controller.gameData.value?.currentPlayer}'s Turn", // Display the current player's turn
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

  final TictactoeOnlineController controller;

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

  final TictactoeOnlineController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        hoverColor: Colors.black26,
        onTap: () {
          if ((controller.gameData.value?.gameEnd ?? false) |
              (controller.gameData.value?.moves?[index].isNotEmpty ?? false) |
              (controller.gameData.value?.currentPlayer == 'Nobody') |
              (controller.gameData.value?.currentPlayer !=
                  controller.my_name)) {
            return;
          }
          controller.updateOccupiedIndex(index);
        },
        child: Container(
          width: Get.width / 4,
          height: Get.width / 4,
          color: (controller.gameData.value?.moves?[index].isEmpty ?? false)
              ? Colors.black26
              : (controller.gameData.value?.moves?[index] ?? '') == 'O'
                  ? Colors.red
                  : Colors.amber,
          margin: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            controller.gameData.value?.moves?[index] ?? '',
            style: const TextStyle(fontSize: 70),
          )),
        ),
      ),
    );
  }
}
