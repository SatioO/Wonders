import 'package:flutter/material.dart';
import 'ui/pages/index.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx) => Animations(),
  '/neumorph': (ctx) => Neumorph(),
  '/posts': (ctx) => PostsScreen()
};
