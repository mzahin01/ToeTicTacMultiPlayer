// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttt/app/modules/tictactoe_online/widget/fire_widget.dart';

class TictactoeOnlineController extends GetxController {
  RxList<Welcome> basketItems = RxList.empty(growable: true);
  RxString PLAYER_X = "O".obs;
  RxString PLAYER_Y = "X".obs;
  RxString currentPlayer = RxString('');
  RxBool gameEnd = RxBool(false);
  RxBool myturn = RxBool(false);
  RxList<String> occupied = RxList.empty(growable: true);
  RxString concatenatedString = "".obs;

  @override
  void onInit() {
    initializeGame();
    FirebaseFirestore.instance
        .collection('ticTacToe')
        .doc('JEltafvog74tZle6wAWc')
        .snapshots()
        .listen(listenFunction);
    super.onInit();
  }

  void listenFunction(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.exists) {
      // Extract data from the document
      List<dynamic> data = doc.data()!['indexes'];
      // Update local state or perform other actions based on the document data
      occupied.value = List<String>.from(data);
      if (occupied.isEmpty) {
        initializeGame();
      }
      // print(occupied);
      gameroutine();
    }
  }

  void initializeGame() {
    currentPlayer.value = PLAYER_X.value;
    gameEnd.value = false;
    myturn.value = false;
    occupied.clear();
    occupied.addAll(["", "", "", "", "", "", "", "", ""]);
    work();
  }

  work() {
    List<String> emptyList = List.filled(9, '');
    FirebaseFirestore.instance
        .collection("ticTacToe")
        .doc('JEltafvog74tZle6wAWc')
        .update({'indexes': emptyList});
  }

  void updateOccupiedIndex(int index, String value) {
    occupied[index] = value;
    FirebaseFirestore.instance
        .collection('ticTacToe')
        .doc('JEltafvog74tZle6wAWc')
        .update({'indexes': occupied});
  }

  logic(int index) {
    occupied[index] = currentPlayer.value;
    updateOccupiedIndex(index, currentPlayer.value);
    // _onlineTurn();
  }

  void gameroutine() {
    _changeTurn();
    _checkwinner();
    _checkForDraw();
    onlineTurn();
  }

  onlineTurn() {
    if (myturn.value == true) {
      myturn.value = false;
    } else {
      myturn.value = true;
    }
    // print(myturn);
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
