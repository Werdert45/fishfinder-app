import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';

// @author Ian Ronk
// @class DisplayPictureScreen

// TODO Add the function of removing the image if the image is taken through the app
// TODO add loading circle


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
        onPressed: () async {
          // Get the image from the image path
          var _image = File(imagePath);

          // Convert into list and stringify
          List<int> imageBytes = _image.readAsBytesSync();

          // encode in base64Url
          String base64Image = base64UrlEncode(imageBytes);
          var uri = Uri.http("192.168.2.21:5000", "/fishfinder/predict/");

          // Send in correct format
          Map<String, String> data = {'b64': base64Image};
          print(data['b64'].length);
          http.Response response = await http.post(uri, body:data);

          // Response is the species, resp can be changed into a string for testing
          var resp = response.body;
          print(resp);

          // TODO set path to individual species and gives specific information
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