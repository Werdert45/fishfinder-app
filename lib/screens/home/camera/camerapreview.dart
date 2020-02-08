import 'package:flutter/material.dart';
import 'dart:io';
import 'package:fishfinder_app/screens/home/camera/scanscreen.dart';
import 'dart:async';
// @author Ian Ronk
// @class DisplayPictureScreen

// TODO
// Add the function of removing the image if the image is taken through the app

class DisplayPictureScreen extends StatelessWidget {

  // Get path to image
  final String imagePath;
  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The image is extracted from either gallery or made picture
      body: Stack(
        children: <Widget>[
          // Get image file by file path
          Image.file(File(imagePath),fit: BoxFit.cover, height: double.infinity, width: double.infinity, alignment: Alignment.center),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                  margin: const EdgeInsets.only(top: 30, right: 30),
                  child: IconButton(
                    icon: Icon(Icons.clear, size: 40, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
              )
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) =>
      ScanPictureScreen(),
      ),
      );
      },
        label: Row(
          children: <Widget>[Text("SCAN"), SizedBox(width: 10), Icon(Icons.done)],
        ),
        icon: Container(),
        backgroundColor: Colors.deepOrange,
        splashColor: Colors.deepOrangeAccent,
      ),
    );
  }
}