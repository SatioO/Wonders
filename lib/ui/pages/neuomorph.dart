import 'package:flutter/material.dart';
import '../widgets/index.dart';

class Neuomorph extends StatefulWidget {
  @override
  _NeuomorphState createState() => _NeuomorphState();
}

class _NeuomorphState extends State<Neuomorph> {
  bool _isHomePressed = false;
  bool _isSettingsPressed = false;
  bool _isFavoritePressed = false;
  bool _isMessagePressed = false;

  void onHomeTap() {
    setState(() {
      _isHomePressed = !_isHomePressed;
    });
  }

  void onSettingsTap() {
    setState(() {
      _isSettingsPressed = !_isSettingsPressed;
    });
  }

  void onFavoriteTap() {
    setState(() {
      _isFavoritePressed = !_isFavoritePressed;
    });
  }

  void onMessageTap() {
    setState(() {
      _isMessagePressed = !_isMessagePressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
              RaisedButton(
                color: Colors.grey.shade300,
                onPressed: () {
                  Navigator.pushNamed(context, "/posts");
                },
                child: Text("Press"),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                            onTap: onHomeTap,
                            child: _isHomePressed
                                ? SoftButtonPressed(
                                    size: 68,
                                    icon: Icon(Icons.home,
                                        size: 30, color: Colors.grey.shade700))
                                : SoftButton(
                                    size: 68,
                                    icon: Icon(Icons.home,
                                        size: 30,
                                        color: Colors.grey.shade700))),
                        GestureDetector(
                            onTap: onSettingsTap,
                            child: _isSettingsPressed
                                ? SoftButtonPressed(
                                    size: 68,
                                    icon: Icon(Icons.settings,
                                        size: 30, color: Colors.grey.shade700))
                                : SoftButton(
                                    size: 68,
                                    icon: Icon(Icons.settings,
                                        size: 30,
                                        color: Colors.grey.shade700))),
                        GestureDetector(
                            onTap: onFavoriteTap,
                            child: _isFavoritePressed
                                ? SoftButtonPressed(
                                    size: 68,
                                    icon: Icon(Icons.favorite,
                                        size: 30, color: Colors.pink))
                                : SoftButton(
                                    size: 68,
                                    icon: Icon(Icons.favorite,
                                        size: 30, color: Colors.pink))),
                        GestureDetector(
                            onTap: onMessageTap,
                            child: _isMessagePressed
                                ? SoftButtonPressed(
                                    size: 68,
                                    icon: Icon(Icons.message,
                                        size: 30, color: Colors.grey.shade700))
                                : SoftButton(
                                    size: 68,
                                    icon: Icon(Icons.message,
                                        size: 30, color: Colors.grey.shade700)))
                      ]))
              // RaisedButton(onPressed: play)
            ]))));
  }
}
