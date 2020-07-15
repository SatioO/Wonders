import 'package:flutter/material.dart';

class SoftButtonPressed extends StatelessWidget {
  final Icon icon;
  final double size;

  SoftButtonPressed({Key key, @required this.icon, @required this.size})
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
                        color: Colors.white,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Colors.grey[600],
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.grey[700],
                        Colors.grey[600],
                        Colors.grey[500],
                        Colors.grey[200],
                      ],
                      stops: [
                        0,
                        0.1,
                        0.3,
                        1
                      ])),
            )));
  }
}
