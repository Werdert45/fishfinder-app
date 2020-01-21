import 'package:camera/camera.dart';
import 'package:fishfinder_app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fishfinder_app/models/user.dart';
import 'package:fishfinder_app/screens/home/homescreen/home.dart';

class Wrapper extends StatefulWidget {
  final List<CameraDescription> cameras;
  Wrapper({this.cameras});


  @override

  _WrapperState createState() => _WrapperState();


}


class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override

  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return MainMenu(widget.cameras);
    }
  }
}

