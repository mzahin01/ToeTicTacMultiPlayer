import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttt/app/modules/tictactoe_online/model/game_data.dart';

class TictactoeOnlineController extends GetxController {
  String myName = '';
  String opponentName = '';
  RxString concatenatedUids = RxString('');
  Rx<GameData?> gameData = Rx(null);
  // RxString finalMessage = ''.obs;

  @override
  Future<void> onInit() async {
    String? opponentUid = Get.parameters['opponent'];
    String? uid = Get.parameters['mine'];
    await fetchPlayersNames(uidMine: uid, uidOpp: opponentUid);
    concatenatedUids.value = concatenateUids(uid!, opponentUid!);
    await startfire(uid, opponentUid, concatenatedUids.value);
    FirebaseFirestore.instance
        .collection('ticTacToe')
        .doc(concatenatedUids.value)
        .snapshots()
        .listen(parseGameData);
    super.onInit();
  }

  Future<void> fetchPlayersNames({String? uidMine, String? uidOpp}) async {
    DocumentSnapshot<Map<String, dynamic>> data1 =
        await FirebaseFirestore.instance.collection('users').doc(uidMine).get();
    myName = data1.data()?["name"];
    DocumentSnapshot<Map<String, dynamic>> data2 =
        await FirebaseFirestore.instance.collection('users').doc(uidOpp).get();
    opponentName = data2.data()?["name"];
  }

  String concatenateUids(String uidOpponent, String uidMine) {
    if (uidOpponent.compareTo(uidMine) <= 0) {
      return uidOpponent + uidMine;
    } else {
      return uidMine + uidOpponent;
    }
  }

  Future<void> startfire(
    String uidOpponent,
    String uidMine,
    String concatenatedUids,
  ) async {
    DocumentReference gameRef = FirebaseFirestore.instance
        .collection('ticTacToe')
        .doc(concatenatedUids);
    try {
      DocumentSnapshot doc = await gameRef.get();
      if (!doc.exists) {
        await initializeGame(uidMine, uidOpponent);
      } else {
        parseGameData(doc as DocumentSnapshot<Map<String, dynamic>>);
      }
    } catch (e) {
      print('Error fetching/creating game document: $e');
    }
  }

  Future<void> parseGameData(DocumentSnapshot<Map<String, dynamic>> doc) async {
    if (doc.exists) {
      Map<String, dynamic>? data = doc.data();
      gameData.value = GameData.fromJson(data ?? {});
      gameroutine();
    }
  }

  Future<void> initializeGame(String uidMine, String uidOppo) async {
    gameData.value = GameData(
      currentPlayer: 'Nobody',
      moves: List.filled(9, ''),
      player1: uidMine.compareTo(uidOppo) <= 0 ? myName : opponentName,
      player2: uidMine.compareTo(uidOppo) <= 0 ? opponentName : myName,
      player1Uid: uidMine.compareTo(uidOppo) <= 0 ? uidMine : uidOppo,
      player2Uid: uidMine.compareTo(uidOppo) <= 0 ? uidOppo : uidMine,
      gameEnd: false,
      gameStart: false,
      startPlayer: null,
      gameEndMassage: "",
    );

    await FirebaseFirestore.instance
        .collection('ticTacToe')
        .doc(concatenatedUids.value)
        .set(
          gameData.value?.toJson() ?? {},
        );
  }

  Future<void> gameStart() async {
    gameData.value?.startPlayer = myName;
    gameData.value?.currentPlayer = myName;
    gameData.value?.gameStart = true;
    await FirebaseFirestore.instance
        .collection('ticTacToe')
        .doc(concatenatedUids.value)
        .set(
          gameData.value?.toJson() ?? {},
        );
  }

  void updateOccupiedIndex(int index) async {
    gameData.value?.moves?[index] =
        (myName == (gameData.value?.startPlayer ?? '')) ? 'O' : 'X';
    gameData.value?.currentPlayer = opponentName;
    try {
      DocumentReference gameRef = FirebaseFirestore.instance
          .collection('ticTacToe')
          .doc(concatenatedUids.value);
      gameRef.set(gameData.value?.toJson() ?? {});
    } catch (e) {
      print('Error updating moves field: $e');
    }
  }

  void gameroutine() {
    if (gameData.value?.gameEnd == true) {
      showGameOverMessage();
    } else {
      _checkwinner();
      _checkForDraw();
    }
  }

  _checkForDraw() {
    if (gameData.value?.gameEnd ?? false) {
      return;
    }
    bool draw = true;
    for (var i in gameData.value?.moves ?? []) {
      if (i.isEmpty) {
        draw = false;
      }
    }

    if (draw) {
      gameData.value?.gameEndMassage = "Drawn";
      gameData.value?.gameEnd = true;
      gamEndSet();
      // showGameOverMessage();
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
      String playerPosition0 = gameData.value?.moves?[winningPos[0]] ?? '';
      String playerPosition1 = gameData.value?.moves?[winningPos[1]] ?? '';
      String playerPosition2 = gameData.value?.moves?[winningPos[2]] ?? '';

      if (playerPosition0.isNotEmpty) {
        if (playerPosition0 == playerPosition1 &&
            playerPosition0 == playerPosition2) {
          // showGameOverMessage("${gameData.value?.currentPlayer} won");
          gameData.value?.gameEnd = true;
          gameData.value?.gameEndMassage =
              "${gameData.value?.currentPlayer} won";
          gamEndSet();
          // showGameOverMessage();
          return;
        }
      }
    }
  }

  Future<void> gamEndSet() async {
    await FirebaseFirestore.instance
        .collection('ticTacToe')
        .doc(concatenatedUids.value)
        .set(
          gameData.value?.toJson() ?? {},
        );
  }

  showGameOverMessage() {
    Get.snackbar(
      "Game Over",
      gameData.value?.gameEndMassage ?? "",
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
