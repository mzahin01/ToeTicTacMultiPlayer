// ignore: unused_import
// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttt/app/modules/home/widget/fire_widget.dart';

class HomeController extends GetxController {
  RxList<Welcome> basketItems = RxList.empty(growable: true);
  RxString PLAYER_X = "O".obs;
  RxString PLAYER_Y = "X".obs;
  RxString currentPlayer = RxString('');
  RxBool gameEnd = RxBool(false);
  RxList<String> occupied = RxList.empty(growable: true);
  RxString concatenatedString = "".obs;

  @override
  void onInit() {
    initializeGame();
    FirebaseFirestore.instance
        .collection('ticTacToe')
        .snapshots()
        .listen((records) {
      mapRecords(records);
    });
    fetchRecord();
    super.onInit();
  }

  fetchRecord() async {
    var record = await FirebaseFirestore.instance.collection('ticTacToe').get();
    mapRecords(record);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    List<Welcome> d = records.docs
        .map(
          (item) => Welcome(
            id: item.id,
            name: item['name'],
            quantity: item['quantity'],
          ),
        )
        .toList()
        .obs;
    basketItems.value = d;
  }

  void initializeGame() {
    currentPlayer.value = PLAYER_X.value;
    gameEnd.value = false;
    occupied.clear();
    occupied.addAll(["", "", "", "", "", "", "", "", ""]);
    work();
  }

  void updateConcatenatedString() {
    List<String> replacedList =
        occupied.map((element) => element.isEmpty ? 'e' : element).toList();
    concatenatedString.value = replacedList.join();
    var item = Welcome(
        id: 'hwKXvs2fNRCVsvYSCFNd',
        name: "OccupiedIndexes",
        quantity: concatenatedString.value);
    FirebaseFirestore.instance
        .collection("ticTacToe")
        .doc('hwKXvs2fNRCVsvYSCFNd')
        .update(item.toJson());
  }

  work() {
    concatenatedString.value = 'eeeeeeeee';
    var item = Welcome(
        id: 'hwKXvs2fNRCVsvYSCFNd',
        name: "OccupiedIndexes",
        quantity: concatenatedString.value);
    FirebaseFirestore.instance
        .collection("ticTacToe")
        .doc('hwKXvs2fNRCVsvYSCFNd')
        .update(item.toJson());
  }

  logic(int index) {
    occupied[index] = currentPlayer.value;
    updateConcatenatedString();
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
