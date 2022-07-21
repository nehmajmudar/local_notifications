// To parse this JSON data, do
//
//     final jokeModel = jokeModelFromJson(jsonString);

import 'dart:convert';

JokeModel jokeModelFromJson(String str) => JokeModel.fromJson(json.decode(str));

String jokeModelToJson(JokeModel data) => json.encode(data.toJson());

class JokeModel {
  JokeModel({
    this.id,
    this.setup,
    this.delivery,
    this.lang,
  });

  int? id;
  String? setup;
  String? delivery;
  String? lang;

  factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
    id: json["id"],
    setup: json["setup"],
    delivery: json["delivery"],
    lang: json["lang"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "setup": setup,
    "delivery": delivery,
    "lang": lang,
  };
}
