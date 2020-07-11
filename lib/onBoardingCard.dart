import 'package:flutter/material.dart';

class OnBoardingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () => print("hello"),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 16.0),
                    blurRadius: 16.0,
                  )
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Start to really know your pet",
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                    color: Theme.of(context).primaryColorDark.withOpacity(0.9)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Get access to all content, satisfy your curiosity and improve your knowledge",
                  style: TextStyle(
                      fontSize: 16,
                      height: 1.35,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600.withOpacity(0.8)),
                ),
              )
            ])));
  }
}
