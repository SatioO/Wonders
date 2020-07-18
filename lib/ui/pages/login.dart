import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  bool _isFinished = false;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.linearToEaseOut);

    super.initState();
  }

  void _onInputFocus() {
    if (!_isFinished) {
      setState(() {
        _isFinished = true;
      });
      _animationController.forward();
    } else {
      setState(() {
        _isFinished = false;
      });
      _animationController.reverse();
    }
  }

  void _onNavigate() {
    Navigator.of(context).pushNamed("/cards");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(84, 60, 219, 1),
          Color.fromRGBO(132, 121, 243, 1),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Stack(
          children: <Widget>[
            Align(
              child: RaisedButton(
                  onPressed: _onInputFocus,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
              alignment: Alignment.center,
            ),
            Align(
              child: RaisedButton(
                  onPressed: _onNavigate,
                  child: Text(
                    "Navigate",
                    style: TextStyle(color: Colors.white),
                  )),
              alignment: Alignment.centerLeft,
            ),
            Align(
                child: AnimatePaint(
                  animation: _animation,
                  tween: Tween(begin: 150, end: 300),
                ),
                alignment: Alignment.bottomCenter)
          ],
        ),
      ),
    );
  }
}

class AnimatePaint extends AnimatedWidget {
  final Animation<double> animation;
  final Tween<double> tween;

  AnimatePaint({
    Key key,
    @required this.animation,
    @required this.tween,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CloudPainter(),
      size: Size(MediaQuery.of(context).size.width, tween.evaluate(animation)),
    );
  }
}

class CloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    int height = 150;

    Paint paint = new Paint()..color = Colors.white;
    Path cloud = new Path()
      ..moveTo(0, size.height)
      ..lineTo(0, height * 0.30)
      ..quadraticBezierTo(
          size.width * 0.20, height * 0.30, size.width * 0.25, height * 0.65)
      ..quadraticBezierTo(
          size.width * 0.30, height * 0.65, size.width * 0.35, height * 0.70)
      ..quadraticBezierTo(
          size.width * 0.40, height * 0.30, size.width * 0.60, height * 0.50)
      ..quadraticBezierTo(
          size.width * 0.75, height * 0.05, size.width * 0.95, height * 0.45)
      ..lineTo(size.width, height * 0.40)
      ..lineTo(size.width, size.height);
    canvas.drawPath(cloud, paint);
  }

  @override
  bool shouldRepaint(oldDelegate) {
    return false;
  }
}
