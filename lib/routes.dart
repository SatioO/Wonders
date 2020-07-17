import 'package:flutter/material.dart';
import 'ui/pages/index.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx) => Cards(),
  '/neumorph': (ctx) => Neumorph(),
  '/posts': (ctx) => PostsScreen(),
  '/animate': (ctx) => Animations(),
};
