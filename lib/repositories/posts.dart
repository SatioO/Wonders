import 'dart:convert';
import './base.dart';
import '../services/index.dart';
import '../models/index.dart';

class PostsRepository extends BaseRepository {
  List<PostItem> posts = [];

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
