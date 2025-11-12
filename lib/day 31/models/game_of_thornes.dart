import 'dart:convert';

List<GameOfThornes> gameOfThornesFromJson(String str) =>
    List<GameOfThornes>.from(
      json.decode(str).map((x) => GameOfThornes.fromJson(x)),
    );

String gameOfThornesToJson(List<GameOfThornes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GameOfThornes {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? title;
  final String? family;
  final String? image;
  final String? imageUrl;

  GameOfThornes({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.title,
    this.family,
    this.image,
    this.imageUrl,
  });

  factory GameOfThornes.fromJson(Map<String, dynamic> json) => GameOfThornes(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    fullName: json["fullName"],
    title: json["title"],
    family: json["family"],
    image: json["image"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "fullName": fullName,
    "title": title,
    "family": family,
    "image": image,
    "imageUrl": imageUrl,
  };
}
