import 'package:crisil/home/home.dart';
import 'package:flutter/material.dart';
import 'login/login.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx) => Home(),
  Login.routeName: (ctx) => Login()
};
