import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  ScrollController _controller;
  double _scrollOffset = 0.0;
  int _currentIndex = 0;
  bool _didAnimStart = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    _controller.addListener(() {
      print(_didAnimStart);
      if (_controller.offset > _scrollOffset + 5 &&
          _currentIndex < 3 &&
          _didAnimStart) {
        setState(() {
          _scrollOffset = _scrollOffset + MediaQuery.of(context).size.width;
          _currentIndex = _currentIndex + 1;
        });
        _controller.animateTo(_scrollOffset,
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn);
        setState(() {
          _didAnimStart = false;
        });
      } else if (_controller.offset < _scrollOffset - 5 &&
          _currentIndex > 0 &&
          _didAnimStart) {
        _controller.animateTo(_scrollOffset - MediaQuery.of(context).size.width,
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn);
        setState(() {
          _scrollOffset = _scrollOffset - MediaQuery.of(context).size.width;
          _currentIndex = _currentIndex - 1;
          _didAnimStart = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollStartNotification) {
          setState(() {
            _didAnimStart = true;
          });
        } else if (notification is ScrollEndNotification) {
          setState(() {
            _didAnimStart = false;
          });
        }

        return true;
      },
      child: ListView(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        children: <Widget>[
          Card(color: Colors.amber),
          Card(color: Colors.blue),
          Card(color: Colors.brown),
          Card(color: Colors.green)
        ],
      ),
    )));
  }
}

class Card extends StatelessWidget {
  final Color color;

  Card({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: color,
    );
  }
}
