import 'package:crisil/onBoardingCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromRGBO(129, 108, 255, 1),
        primaryColorDark: Color.fromRGBO(30, 48, 110, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(top: 52, left: 0, right: 0, child: OnBoardingCard()),
              Positioned(
                  top: 52 + (MediaQuery.of(context).size.height * 0.65) - 25,
                  left: (MediaQuery.of(context).size.width / 2) - 60,
                  child: Ink(
                    height: 50,
                    width: 120,
                    child: InkWell(
                        onTap: () {
                          print("tapped");
                        },
                        child: Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.amberAccent.shade400,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0))),
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
