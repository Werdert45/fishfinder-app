import 'package:fishfinder_app/screens/authenticate/register.dart';
import 'package:fishfinder_app/screens/authenticate/welcome.dart';
import 'package:flutter/material.dart';

// @author Ian Ronk
// @class Authenticate

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  // Change view according to whether user chooses register or login
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return Welcome();
  }
}