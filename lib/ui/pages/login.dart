import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  AnimationController _controller;
  bool _isFinished = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    super.initState();
  }

  void _onInputFocus() {
    if (!_isFinished) {
      setState(() {
        _isFinished = true;
      });
      _controller.forward();
    } else {
      setState(() {
        _isFinished = false;
      });
      _controller.reverse();
    }
  }

  void _onNavigate() {
    Navigator.of(context).pushNamed("/cards");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(130, 84, 232, 1),
              Color.fromRGBO(114, 106, 244, 1),
            ],
            stops: [0.15, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      onPressed: _onNavigate,
                      color: Colors.white,
                      child: Text("Navigate")),
                  RaisedButton(
                      onPressed: _onInputFocus,
                      color: Colors.white,
                      child: Text("Login"))
                ],
              ),
            ),
            Align(
              child: AnimatePaint(
                  controller: _controller.view,
                  height: MediaQuery.of(context).size.height * 0.4),
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
    );
  }
}

class AnimatePaint extends StatelessWidget {
  AnimatePaint({Key key, @required this.controller, @required this.height})
      : slide = Tween<double>(
          begin: 0.0,
          end: -150.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.000, 1.000, curve: Curves.easeInOut),
          ),
        ),
        expand = Tween<double>(
          begin: 150.0,
          end: height,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.300, 1.000, curve: Curves.fastOutSlowIn),
          ),
        ),
        super(key: key);

  final Animation<double> controller;
  final Animation<double> expand;
  final Animation<double> slide;
  final double height;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: Transform.translate(
              offset: Offset(slide.value, 0),
              child: CustomPaint(
                painter: BackgroundCloudPainter(),
                size: Size(MediaQuery.of(context).size.width, 200),
              )),
        ),
        Positioned(
          bottom: 0,
          child: CustomPaint(
            painter: ForegroundCloudPainter(),
            size: Size(MediaQuery.of(context).size.width, expand.value),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class ForegroundCloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    int height = 150;

    Paint paint = new Paint()..color = Colors.white;
    Path cloud = new Path()
      ..moveTo(0, size.height)
      ..lineTo(0, height * 0.35)
      ..quadraticBezierTo(
          size.width * 0.16, height * 0.30, size.width * 0.22, height * 0.65)
      ..quadraticBezierTo(
          size.width * 0.30, height * 0.62, size.width * 0.345, height * 0.70)
      ..quadraticBezierTo(
          size.width * 0.45, height * 0.25, size.width * 0.64, height * 0.52)
      ..quadraticBezierTo(
          size.width * 0.78, height * 0.075, size.width * 0.96, height * 0.46)
      ..lineTo(size.width, height * 0.42)
      ..lineTo(size.width, size.height);
    canvas.drawPath(cloud, paint);
  }

  @override
  bool shouldRepaint(oldDelegate) {
    return false;
  }
}

class BackgroundCloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    int height = 150;

    Paint paint = new Paint()..color = Colors.white24;
    Path cloud = new Path()
      ..moveTo(0, size.height)
      ..lineTo(0, height * 0.85)
      ..quadraticBezierTo(
          size.width * 0.05, height * 0.75, size.width * 0.15, height * 0.85)
      ..quadraticBezierTo(
          size.width * 0.20, height * 0.55, size.width * 0.35, height * 0.70)
      ..quadraticBezierTo(
          size.width * 0.42, height * 0.35, size.width * 0.58, height * 0.55)
      ..quadraticBezierTo(
          size.width * 0.72, height * 0.25, size.width * 0.85, height * 0.65)
      ..quadraticBezierTo(
          size.width * 0.95, height * 0.6, size.width, height * 0.85)
      ..lineTo(size.width, size.height);
    canvas.drawPath(cloud, paint);
  }

  @override
  bool shouldRepaint(oldDelegate) {
    return false;
  }
}
