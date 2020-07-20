import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomSlider extends StatefulWidget {
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        value: 0.0,
        upperBound: 1.0,
        lowerBound: -1.0,
        duration: Duration(seconds: 15))
      ..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) =>
            ClipPath(clipper: WaveClipper(_controller.value), child: child),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  double clip = 0;

  WaveClipper(this.clip);

  @override
  getClip(Size size) {
    double cx =
        size.width * 0.5 + (size.width * 0.6) * math.sin(math.pi * clip);
    double cy = (size.height * 0.8) + 60 * math.cos(math.pi * clip);

    Path path = new Path()
      ..lineTo(0.0, size.height * 0.8)
      ..quadraticBezierTo(cx, cy, size.width, size.height * 0.8)
      ..lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
