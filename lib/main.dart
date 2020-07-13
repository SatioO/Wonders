import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'posts/posts.dart';
import 'posts/providers/posts_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => Posts())],
        child: MaterialApp(
            title: 'Todo App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity),
            initialRoute: PostsScreen.routeName,
            routes: routes));
  }
}
