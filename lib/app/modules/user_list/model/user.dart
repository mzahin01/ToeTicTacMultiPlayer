import 'dart:convert';

class OfflineUser {
  String? uid;
  String? email;
  String? name;
  int? played;
  int? won;

  OfflineUser({
    this.uid,
    this.email,
    this.name,
    this.played,
    this.won,
  });

  factory OfflineUser.fromRawJson(String str) =>
      OfflineUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OfflineUser.fromJson(Map<String, dynamic> json) => OfflineUser(
        uid: json["uid"],
        email: json["email"],
        name: json["name"],
        played: json["Played"],
        won: json["Won"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "Played": played,
        "Won": won,
      };
}
