import 'package:flutter/material.dart';

class SoftButton extends StatelessWidget {
  final Icon icon;
  final double size;

  SoftButton({Key key, @required this.icon, @required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(4),
        child: Container(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              height: size,
              width: size,
              child: icon,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade600,
                        offset: Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1.0),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.grey[200],
                        Colors.grey[300],
                        Colors.grey[400],
                        Colors.grey[500],
                      ],
                      stops: [
                        0.1,
                        0.3,
                        0.8,
                        1.0
                      ])),
            )));
  }
}
