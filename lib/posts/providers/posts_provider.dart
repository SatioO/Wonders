import 'package:flutter/material.dart';
import '../models/post_item.dart';
import '../services/posts.dart';

class Posts with ChangeNotifier {
  List<PostItem> _posts = [];
  bool isLoading = false;

  List<PostItem> get posts {
    return [..._posts];
  }

  void getPosts() async {
    setLoading(true);
    final response = await PostsService.getPosts();
    setPosts(response);
    setLoading(false);
  }

  setLoading(status) {
    isLoading = status;
    notifyListeners();
  }

  setPosts(posts) {
    _posts = posts;
    notifyListeners();
  }
}
