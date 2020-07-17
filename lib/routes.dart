import 'package:flutter/material.dart';
import 'ui/pages/index.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx) => Cards(),
  '/neumorph': (ctx) => Neumorph(),
  '/posts': (ctx) => PostsScreen(),
  '/animate': (ctx) => Animations(),
};
