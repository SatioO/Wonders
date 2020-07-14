import 'package:flutter/material.dart';
import 'ui/pages/index.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx) => PostsScreen()
};
