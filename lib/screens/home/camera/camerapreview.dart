import 'package:flutter/material.dart';
import 'dart:io';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Stack(
        children: <Widget>[
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
        onPressed: () {},
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