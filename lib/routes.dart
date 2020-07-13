import 'package:flutter/material.dart';
import 'login/login.dart';
import 'home/home.dart';
import 'posts/posts.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx) => Home(),
  Login.routeName: (ctx) => Login(),
  PostsScreen.routeName: (ctx) => PostsScreen()
};
