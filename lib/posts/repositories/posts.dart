import 'dart:convert';

import 'package:crisil/posts/models/post_item.dart';
import './base.dart';
import '../services/posts.dart';

class PostsRepository extends BaseRepository {
  List<PostItem> posts = [];

  PostsRepository() {
    print("got here");
  }

  @override
  Future<void> loadData() async {
    startLoading();
    final response = await PostsService.getPosts();
    posts = List.from(json.decode(response.body))
        .map((post) => PostItem.fromJson(post))
        .toList();

    finishLoading();
  }
}
