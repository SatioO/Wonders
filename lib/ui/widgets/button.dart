import 'package:flutter/material.dart';

@immutable
class SoftButton extends StatelessWidget {
  final Icon icon;
  final double size;

  SoftButton({Key key, @required this.icon, @required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Colors.grey.shade100,
                    Colors.grey.shade300,
                    Colors.grey.shade400,
                    Colors.grey.shade500
                  ],
                  stops: [
                    0.1,
                    0.3,
                    0.8,
                    1.0
                  ])),
        ));
  }
}
