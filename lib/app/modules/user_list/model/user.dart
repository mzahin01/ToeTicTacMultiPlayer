import 'dart:convert';

OfflineUser userFromJson(String str) => OfflineUser.fromJson(json.decode(str));

String userToJson(OfflineUser data) => json.encode(data.toJson());

class OfflineUser {
  String? uid;
  String? name;
  String? email;

  OfflineUser({
    required this.uid,
    required this.name,
    required this.email,
  });

  factory OfflineUser.fromJson(Map<String, dynamic> json) => OfflineUser(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
      };
}
