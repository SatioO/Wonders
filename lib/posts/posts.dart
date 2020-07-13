import 'package:crisil/posts/services/posts_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/posts_provider.dart';

class PostsScreen extends StatelessWidget {
  static const String routeName = '/posts';

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<Posts>(context);

    return Scaffold(
        body: FutureBuilder(
            future: PostsService().getPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text(snapshot.data[index].title));
                    });
              } else {
                return Text("");
              }
            }));
  }
}
