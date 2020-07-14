import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../repositories/index.dart';

class PostsScreen extends StatefulWidget {
  static const String routeName = '/posts';

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<PostsRepository>(builder: (context, model, child) {
      return Scaffold(
          body: Container(
              color: Theme.of(context).primaryColor,
              child: model.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: model.posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            title: Text(model.posts[index].title,
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                            subtitle: Text(model.posts[index].body));
                      })));
    }));
  }
}
