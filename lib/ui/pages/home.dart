import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  bool _isPlayed = false;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _animation = Tween<double>(begin: 1.0, end: 2.5).animate(
        CurvedAnimation(curve: Curves.linearToEaseOut, parent: _controller));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void play() {
    if (!_isPlayed)
      _controller.forward();
    else
      _controller.reverse();

    setState(() {
      _isPlayed = !_isPlayed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
            ScaleTransition(
                scale: _animation,
                child: Container(height: 100, width: 100, color: Colors.amber)),
            RaisedButton(onPressed: play)
          ]))),
    );
  }
}
