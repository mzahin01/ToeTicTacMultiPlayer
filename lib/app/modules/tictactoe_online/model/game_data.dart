import 'dart:convert';

class GameData {
  List<String>? moves;
  String? player1;
  String? player2;
  String? player1Uid;
  String? player2Uid;
  String? currentPlayer;
  bool? gameEnd;
  bool? gameStart;
  String? startPlayer;
  String? gameEndMassage;
  String? winner;

  GameData({
    this.moves,
    this.player1,
    this.player2,
    this.player1Uid,
    this.player2Uid,
    this.currentPlayer,
    this.gameEnd,
    this.gameStart,
    this.startPlayer,
    this.gameEndMassage,
    this.winner,
  });

  factory GameData.fromRawJson(String str) =>
      GameData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameData.fromJson(Map<String, dynamic> json) => GameData(
        moves: json["moves"] == null
            ? []
            : List<String>.from(json["moves"]!.map((x) => x)),
        player1: json["player1"],
        player2: json["player2"],
        player1Uid: json["player1_uid"],
        player2Uid: json["player2_uid"],
        currentPlayer: json["current_player"],
        gameEnd: json["game_end"],
        gameStart: json["game_start"],
        startPlayer: json["start_player"],
        gameEndMassage: json["game_end_massage"],
        winner: json["winner"],
      );

  Map<String, dynamic> toJson() => {
        "moves": moves == null ? [] : List<dynamic>.from(moves!.map((x) => x)),
        "player1": player1,
        "player2": player2,
        "player1_uid": player1Uid,
        "player2_uid": player2Uid,
        "current_player": currentPlayer,
        "game_end": gameEnd,
        "game_start": gameStart,
        "start_player": startPlayer,
        "game_end_massage": gameEndMassage,
        "winner": winner,
      };
}

class UserClass {
  String? email;
  String? name;
  int? played;
  int? won;

  UserClass({
    this.email,
    this.name,
    this.played,
    this.won,
  });

  factory UserClass.fromRawJson(String str) =>
      UserClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        email: json["email"],
        name: json["name"],
        played: json["played"],
        won: json["won"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "played": played,
        "won": won,
      };
}
