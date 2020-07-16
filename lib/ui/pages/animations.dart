import 'dart:math' as math;
import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations>
    with SingleTickerProviderStateMixin {
  final double radius = 80.0;
  AnimationController _controller;
  Animation<double> _rotateY;
  Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    Animation<double> curve =
        CurvedAnimation(parent: _controller, curve: Curves.ease);
    _rotateY = Tween<double>(end: 1, begin: 0).animate(curve);
    _scale = Tween<double>(end: 2, begin: 1).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.1, 0.6, curve: Curves.ease)));
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: <Widget>[
        Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateY(math.pi * _rotateY.value)
              ..scale(_scale.value),
            child: GestureDetector(
                onTap: () => _controller.forward(), child: child))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: AnimatedBuilder(
      animation: _rotateY,
      builder: _buildAnimation,
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(radius / 2))),
      ),
    ))));
  }
}
