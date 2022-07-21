// To parse this JSON data, do
//
//     final jokeModel = jokeModelFromJson(jsonString);

import 'dart:convert';

JokeModel jokeModelFromJson(String str) => JokeModel.fromJson(json.decode(str));

String jokeModelToJson(JokeModel data) => json.encode(data.toJson());

class JokeModel {
  JokeModel({
    this.userId,
    this.id,
    this.title,
  });

  int? userId;
  int? id;
  String? title;

  factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
    userId: json["userId"]==null?null:json["userId"],
    id: json["id"]==null?null:json["id"],
    title: json["title"]==null?null:json["title"]
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
