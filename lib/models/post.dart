import 'dart:convert';

class Posts {
  int id;
  String title;
  String body;

  Posts({this.id, this.title, this.body});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(id: json["id"], title: json["title"], body: json["body"]);
  }

  Map<String, dynamic> toJson() => {"id": id, "title": title, "body": body};
}

List<Posts> postFromJson(String str) {
  return List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));
}
