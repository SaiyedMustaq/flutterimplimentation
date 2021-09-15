// To parse this JSON data, do
//
//     final beers = beersFromJson(jsonString);

import 'dart:convert';

BeerModel beersFromJson(String str) => BeerModel.fromJson(json.decode(str));

String beersToJson(BeerModel data) => json.encode(data.toJson());

class BeerModel {
  BeerModel({
    this.id,
    this.name,
    this.tagline,
    this.descreption,
    this.url,
  });

  int id;
  String name;
  String tagline;
  String descreption;
  String url;

  factory BeerModel.fromJson(Map<String, dynamic> json) => BeerModel(
        id: json["id"],
        name: json["name"],
        tagline: json["tagline"],
        descreption: json["descreption"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tagline": tagline,
        "descreption": descreption,
        "url": url,
      };
}
