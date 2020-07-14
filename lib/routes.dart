import 'package:flutter/material.dart';
import 'pages/posts.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx) => PostsScreen()
};
