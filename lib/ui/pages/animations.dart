import 'package:flutter/material.dart';

class AnimatedCircle extends AnimatedWidget {
  final Tween<double> tween;
  final Animation<double> animation;
  final double radius;
  final int flip;

  AnimatedCircle(
      {Key key,
      @required this.animation,
      @required this.tween,
      @required this.flip,
      @required this.radius})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: FractionalOffset.centerLeft,
        transform: Matrix4.identity()
          ..scale(tween.evaluate(animation) * flip, tween.evaluate(animation)),
        child: Container(
          height: radius,
          width: radius,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(
                  radius / 2.0 - tween.evaluate(animation) / (radius / 2.0))),
        ));
  }
}

class Animations extends StatefulWidget {
  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> with TickerProviderStateMixin {
  final double radius = 88.0;
  AnimationController animationController;
  Animation startAnimation;
  Animation endAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));

    startAnimation = CurvedAnimation(
      parent: animationController,
      curve: Interval(0.000, 0.500, curve: Curves.easeInExpo),
    );

    endAnimation = CurvedAnimation(
      parent: animationController,
      curve: Interval(0.500, 1.000, curve: Curves.easeOutExpo),
    );

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushNamed(context, "/neumorph");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(children: [
      Container(
        color: Colors.grey.shade700,
        width: screenWidth,
        height: double.infinity,
      ),
      Transform(
          transform: Matrix4.identity()
            ..translate(
              screenWidth / 2 - radius / 2.0,
              screenHeight - radius - 80,
            ),
          child: GestureDetector(
            onTap: () => animationController.forward(),
            child: Stack(
              children: <Widget>[
                AnimatedCircle(
                  animation: startAnimation,
                  radius: radius,
                  flip: 1,
                  tween: Tween(begin: 1.0, end: radius),
                ),
                AnimatedCircle(
                  animation: endAnimation,
                  radius: radius,
                  flip: -1,
                  tween: Tween(begin: radius, end: 1.0),
                )
              ],
            ),
          ))
    ]));
  }
}
