import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_item.dart';

class PostsService {
  Future<List<PostItem>> getPosts() async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == 200) {
      final posts = json.decode(response.body);
      List<PostItem> result =
          List.from(posts).map((post) => PostItem.fromJson(post)).toList();
      return result;
    } else {
      return [];
    }
  }
}
