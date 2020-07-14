import 'package:flutter/material.dart';

class PostItem {
  int id;
  String title;
  String body;

  PostItem({@required this.id, @required this.title, this.body = ''});

  factory PostItem.fromJson(Map<String, dynamic> json) {
    return PostItem(id: json["id"], title: json["title"], body: json["body"]);
  }
}
