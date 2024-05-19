// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TictactoeOfflineController extends GetxController {
  RxString PLAYER_X = "O".obs;
  RxString PLAYER_Y = "X".obs;
  RxString currentPlayer = RxString('');
  RxBool gameEnd = RxBool(false);
  RxList<String> occupied = RxList.empty(growable: true);
  RxString concatenatedString = "".obs;

  @override
  void onInit() {
    initializeGame();
    super.onInit();
  }

  void initializeGame() {
    currentPlayer.value = PLAYER_X.value;
    gameEnd.value = false;
    occupied.clear();
    occupied.addAll(["", "", "", "", "", "", "", "", ""]);
  }

  logic(int index) {
    occupied[index] = currentPlayer.value;
    _changeTurn();
    _checkwinner();
    _checkForDraw();
  }

  _checkForDraw() {
    if (gameEnd.value) {
      return;
    }
    bool draw = true;
    for (var i in occupied) {
      if (i.isEmpty) {
        draw = false;
      }
    }

    if (draw) {
      showGameOverMessage("Draw");
      gameEnd.value = true;
    }
  }

  _changeTurn() {
    if (currentPlayer.value == PLAYER_X.value) {
      currentPlayer.value = PLAYER_Y.value;
    } else {
      currentPlayer.value = PLAYER_X.value;
    }
  }

  _checkwinner() {
    List<List<int>> winningList = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var winningPos in winningList) {
      String playerPosition0 = occupied[winningPos[0]];
      String playerPosition1 = occupied[winningPos[1]];
      String playerPosition2 = occupied[winningPos[2]];

      if (playerPosition0.isNotEmpty) {
        if (playerPosition0 == playerPosition1 &&
            playerPosition0 == playerPosition2) {
          showGameOverMessage("$currentPlayer won");
          gameEnd = true.obs;
          return;
        }
      }
    }
  }

  showGameOverMessage(String message) {
    Get.snackbar(
      "Game Over",
      message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      overlayColor: Colors.black.withOpacity(0.5),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(30),
    );
  }
}
