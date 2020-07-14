import 'package:crisil/posts/repositories/posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  static const String routeName = '/posts';

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<PostsRepository>(context);

    return Scaffold(
        body: Consumer<PostsRepository>(builder: (context, model, child) {
      return Scaffold(
          body: model.isLoading
              ? Center(child: Text("Loading..."))
              : ListView.builder(
                  itemCount: model.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text(model.posts[index].title));
                  }));
    }));
  }
}
