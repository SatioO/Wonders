import 'package:flutter/material.dart';
import '../models/post_item.dart';

class Posts with ChangeNotifier {
  List<PostItem> _posts = [
    PostItem(id: 1, title: "First Post"),
    PostItem(id: 2, title: "Second Post")
  ];

  List<PostItem> get posts {
    return [..._posts];
  }
}
