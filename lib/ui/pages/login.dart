import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class NoKeyboardEditableTextFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    // prevents keyboard from showing on first focus
    return false;
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    // prevents keyboard from showing on first focus
    return false;
  }
}

class NoKeyboardEditableText extends EditableText {
  NoKeyboardEditableText({
    @required TextEditingController controller,
    TextStyle style = const TextStyle(),
    InputDecoration decoration,
    Color cursorColor = Colors.black,
    bool autofocus = false,
    Color selectionColor,
  }) : super(
          controller: controller,
          focusNode: NoKeyboardEditableTextFocusNode(),
          style: style,
          cursorColor: cursorColor,
          autofocus: autofocus,
          selectionColor: selectionColor,
          backgroundCursorColor: Colors.black,
        );

  @override
  EditableTextState createState() {
    return NoKeyboardEditableTextState();
  }
}

class NoKeyboardEditableTextState extends EditableTextState {
  @override
  Widget build(BuildContext context) {
    Widget widget = super.build(context);
    return Container(
      decoration:
          UnderlineTabIndicator(borderSide: BorderSide(color: Colors.blueGrey)),
      child: widget,
    );
  }
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _opacity;
  bool _isFinished = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _opacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.000, 0.700, curve: Curves.easeOut),
      ),
    );

    super.initState();
  }

  void _onInputFocus() {
    if (!_isFinished) {
      setState(() {
        _isFinished = true;
      });
      _controller.forward();
    }
  }

  void _onInputFocusOut() {
    if (_isFinished) {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  Text(
                    "Flutter",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 30,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.6,
                    child: Text(
                      "Sign in to continue using our app",
                      style: TextStyle(
                        color: Colors.white60,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  Text("Please enter your phone number",
                      style: TextStyle(
                        color: Colors.white60,
                        fontFamily: 'Poppins',
                        fontSize: 16.5,
                      )),
                  TextField(
                    // showCursor: true,
                    // readOnly: true,
                    focusNode: AlwaysDisabledFocusNode(),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white60, width: 1.0)),
                    ),
                    onTap: _onInputFocus,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Poppins'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: SizedBox(
                      width: 200.0,
                      height: 58.0,
                      child: FlatButton(
                        onLongPress: _onNavigate,
                        onPressed: _onInputFocusOut,
                        color: Color.fromRGBO(129, 113, 247, 1),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Log in",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        textColor: Colors.white60,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.white54,
                                width: 1.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(8.0),
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _opacity.value,
                        child: child,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.white60,
                              fontFamily: 'Poppins',
                              fontSize: 16.5,
                            ),
                          ),
                          Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 16.5,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatePaint(
                  controller: _controller.view,
                  height: MediaQuery.of(context).size.height * 0.40),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatePaint extends StatelessWidget {
  AnimatePaint({Key key, @required this.controller, @required this.height})
      : slide = Tween<double>(begin: 0.0, end: -150.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.000, 1.000, curve: Curves.easeInOut),
          ),
        ),
        expand = Tween<double>(begin: 150.0, end: height).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.300, 1.000, curve: Curves.fastOutSlowIn),
          ),
        ),
        opacity = Tween<double>(begin: 0.000, end: 1.000).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.700, 1.000, curve: Curves.fastOutSlowIn),
          ),
        ),
        super(key: key);

  final Animation<double> controller;
  final Animation<double> expand;
  final Animation<double> slide;
  final Animation<double> opacity;
  final double height;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Transform.translate(
              offset: Offset(slide.value, 0),
              child: CustomPaint(
                painter: BackgroundCloudPainter(),
                size: Size(MediaQuery.of(context).size.width, 200),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            painter: ForegroundCloudPainter(),
            size: Size(MediaQuery.of(context).size.width, expand.value),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 20.0),
              child: Container(
                height: height - 140,
                width: MediaQuery.of(context).size.width,
              )),
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
    int height = 180;

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
          size.width * 0.42, height * 0.40, size.width * 0.55, height * 0.55)
      ..quadraticBezierTo(
          size.width * 0.725, height * 0.20, size.width * 0.85, height * 0.70)
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
