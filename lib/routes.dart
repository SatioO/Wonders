import 'package:flutter/material.dart';
import 'ui/pages/index.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/cards': (ctx) => Cards(),
  '/login': (ctx) => Login(),
  '/neumorph': (ctx) => Neumorph(),
  '/posts': (ctx) => PostsScreen(),
  '/animate': (ctx) => Animations(),
  '/slider': (ctx) => CustomSlider(),
  '/': (ctx) => CustomBottomSheet()
};
