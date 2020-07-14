import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'pages/posts.dart';
import 'providers/theme.dart';
import 'repositories/posts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => PostsRepository())
        ],
        child: Consumer<ThemeProvider>(builder: (context, value, child) {
          return MaterialApp(
              title: 'Wonders',
              debugShowCheckedModeBanner: false,
              theme: value.requestTheme(Themes.light),
              darkTheme: value.requestTheme(Themes.dark),
              initialRoute: PostsScreen.routeName,
              routes: routes);
        }));
  }
}
