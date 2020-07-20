import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[Sheet()],
    ));
  }
}

class Sheet extends StatefulWidget {
  @override
  _SheetState createState() => _SheetState();
}

class _SheetState extends State<Sheet> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  double minHeight = 120.0;
  double get maxHeight => MediaQuery.of(context).size.height;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation =
        CurvedAnimation(curve: Curves.linearToEaseOut, parent: _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          height: Tween<double>(begin: minHeight, end: maxHeight * 0.80)
              .evaluate(_animation),
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: _toggle,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: const BoxDecoration(
                color: Color(0xFF162A49),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
            ),
          ),
        );
      },
    );
  }
}
