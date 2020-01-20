import 'package:fishfinder_app/screens/home/camera/helpers/camerascreen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:fishfinder_app/screens/home/camera/helpers/camerapreview.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        child:IconButton(icon: Icon(Icons.history, color: Colors.white, size: 30), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TakePictureScreen()));
        }),
      )
    );
  }
}
