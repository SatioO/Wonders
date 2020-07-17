import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  ScrollController _scrollController;
  double _scrollIndex = 0;
  double _cardWidth = 375;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity < 0 && _scrollIndex < 3) {
      setState(() {
        _scrollIndex += 1;
      });
      _scrollController.animateTo(_cardWidth * _scrollIndex,
          duration: Duration(milliseconds: 1000), curve: Curves.fastOutSlowIn);
    }

    if (details.primaryVelocity > 0 && _scrollIndex > 0) {
      setState(() {
        _scrollIndex -= 1;
      });
      _scrollController.animateTo(_cardWidth * _scrollIndex,
          duration: Duration(milliseconds: 1000), curve: Curves.fastOutSlowIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onHorizontalDragEnd: _onHorizontalDragEnd,
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Card(color: Colors.amber),
              Card(color: Colors.blue),
              Card(color: Colors.brown),
              Card(color: Colors.green)
            ],
          ),
        ),
      ),
    );
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
