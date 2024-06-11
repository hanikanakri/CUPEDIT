// To parse this JSON data, do
//
//     final getContactRespondModel = getContactRespondModelFromJson(jsonString);

import 'dart:convert';

List<TrendModel> getTrendModelFromJson(String str)
=> List<TrendModel>.
from(json.decode(str).map((x) => TrendModel.fromJson(x)));

String getTrendModelToJson(List<TrendModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrendModel {
  String? title;
  String? followers;
  String? image;

  TrendModel({
    this.title,
    this.followers,
    this.image,
  });

  factory TrendModel.fromJson(Map<String, dynamic> json) => TrendModel(
    title: json["title"],
    followers: json["followers"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "followers": followers,
    "image": image,
  };
}