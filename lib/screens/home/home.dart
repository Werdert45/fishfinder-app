import 'package:fishfinder_app/screens/home/camera/helpers/camerascreen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class MainMenu extends StatefulWidget {
  final List<CameraDescription> cameras;
  MainMenu(this.cameras);

  @override
  _MainMenuState createState() => _MainMenuState();
}


class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
  }


  @override

  Widget build(BuildContext context) {
    return Container(
        child: FloatingActionButton(
          child:IconButton(icon: Icon(Icons.history, color: Colors.white, size: 30), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen(widget.cameras)));
          }),
        )
    );
  }
}

