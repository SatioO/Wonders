import 'package:crisil/posts/posts.dart';
import 'package:crisil/posts/providers/posts.dart';
import 'package:flutter/material.dart';
import 'package:crisil/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PostsProvider())
        ],
        child: MaterialApp(
          title: 'Todo App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: Posts.routeName,
          routes: routes,
        ));
  }
}
