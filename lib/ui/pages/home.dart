import 'package:flutter/material.dart';
import '../widgets/button.dart';

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

    _animation = Tween<double>(begin: 1.0, end: 10.0)
        .animate(CurvedAnimation(curve: Curves.ease, parent: _controller));
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
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
              ScaleTransition(
                  scale: _animation,
                  child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SoftButton(
                              size: 68,
                              icon: Icon(Icons.home,
                                  size: 28, color: Colors.black)),
                          SoftButton(
                              size: 68,
                              icon: Icon(Icons.settings,
                                  size: 28, color: Colors.black)),
                          SoftButton(
                              size: 68,
                              icon: Icon(Icons.favorite,
                                  size: 28, color: Colors.pink)),
                          SoftButton(
                              size: 68,
                              icon: Icon(Icons.message,
                                  size: 28, color: Colors.black))
                        ],
                      )))
              // RaisedButton(onPressed: play)
            ]))));
  }
}
