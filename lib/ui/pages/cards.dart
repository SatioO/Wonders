import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  ScrollController _controller;
  double _startOffset = 0.0;
  double _endOffset = 0.0;
  int _currentIndex = 0;
  bool _shouldAllowScrolling = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    _controller.addListener(() {
      if (_controller.offset > _endOffset &&
          _currentIndex < 3 &&
          _shouldAllowScrolling) {
        _controller.animateTo(_endOffset + MediaQuery.of(context).size.width,
            duration: Duration(seconds: 1), curve: Curves.ease);
      } else if (_controller.offset < _endOffset &&
          _currentIndex > 0 &&
          _shouldAllowScrolling) {
        _controller.animateTo(_endOffset - MediaQuery.of(context).size.width,
            duration: Duration(seconds: 1), curve: Curves.ease);
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
            _startOffset = _controller.offset;
            _shouldAllowScrolling = true;
          });
        } else if (notification is ScrollUpdateNotification) {
          if (_shouldAllowScrolling) {
            setState(() {
              _shouldAllowScrolling = false;
            });
          }
        } else if (notification is ScrollEndNotification) {
          if (_controller.offset > _startOffset && _currentIndex < 3) {
            setState(() {
              _startOffset = _endOffset + MediaQuery.of(context).size.width;
              _endOffset = _endOffset + MediaQuery.of(context).size.width;
              _currentIndex = _currentIndex + 1;
            });
          } else if (_controller.offset < _startOffset && _currentIndex > 0) {
            setState(() {
              _startOffset = _endOffset - MediaQuery.of(context).size.width;
              _endOffset = _endOffset - MediaQuery.of(context).size.width;
              _currentIndex = _currentIndex - 1;
              _shouldAllowScrolling = false;
            });
          }
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
      child: Center(
          child: RaisedButton(
        onPressed: () => Navigator.pushNamed(context, "/animate"),
        child: Text("Navigate"),
      )),
    );
  }
}
