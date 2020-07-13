import 'package:crisil/posts/models/post_item.dart';
import 'package:crisil/posts/providers/posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Posts extends StatelessWidget {
  static const String routeName = '/posts';

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<PostsProvider>(context);
    return Scaffold(
        body: ListView(
            children: posts.posts
                .map((post) => ListTile(title: Text(post.title)))
                .toList()));
  }
}
