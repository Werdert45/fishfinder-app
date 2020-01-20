import 'package:fishfinder_app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/screens/home/homescreen/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:fishfinder_app/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return MainMenu();
    }
  }
}
