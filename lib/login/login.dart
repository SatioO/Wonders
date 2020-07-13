import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void dispose() {
    usernameCtrl.dispose();
    passwordCtrl.dispose();

    super.dispose();
  }

  void onLogin() {
    print(usernameCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: usernameCtrl,
                  decoration: InputDecoration(labelText: "Email / Mobile"),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width * 0.25,
                    child: RaisedButton(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: onLogin,
                      color: Colors.blue,
                    ))
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )));
  }
}
