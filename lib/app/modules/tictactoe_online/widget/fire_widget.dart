import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String id;
  String name;
  String quantity;

  Welcome({
    required this.id,
    required this.name,
    required this.quantity,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
      };
}
