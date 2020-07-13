import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/posts.dart';

class PostsScreen extends StatelessWidget {
  static const String routeName = '/posts';

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<Posts>(context);
    return Scaffold(
        body: ListView(
            children: posts.posts
                .map((post) => ListTile(title: Text(post.title)))
                .toList()));
  }
}
