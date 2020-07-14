import 'dart:convert';
import './base.dart';
import '../services/posts.dart';
import '../models/post_item.dart';

class PostsRepository extends BaseRepository {
  List<PostItem> posts = [];

  PostsRepository();

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
