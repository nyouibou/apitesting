

import 'dart:convert';

List<ModelApi> modelApiFromJson(String str) =>
    List<ModelApi>.from(json.decode(str).map((x) => ModelApi.fromJson(x)));

String modelApiToJson(List<ModelApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelApi {
  int? userId;
  int? id;
  String? title;
  String? body;

  ModelApi({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory ModelApi.fromJson(Map<String, dynamic> json) => ModelApi(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
