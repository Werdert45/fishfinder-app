//import 'package:flutter/material.dart';
//import 'package:camera/camera.dart';
//import 'dart:async';
//import 'package:fishfinder_app/screens/home/camera/helpers/camerascreen.dart';
//
//
//Future<void> main() async {
//  // Ensure that plugin services are initialized so that `availableCameras()`
//  // can be called before `runApp()`
//  WidgetsFlutterBinding.ensureInitialized();
//
//  // Obtain a list of the available cameras on the device.
//  final cameras = await availableCameras();
//
//  // Get a specific camera from the list of available cameras.
//  final firstCamera = cameras.first;
//
//  runApp(
//    MaterialApp(
//      theme: ThemeData.dark(),
//      home: CameraScreen(
//        // Pass the appropriate camera to the TakePictureScreen widget.
//        cameras: cameras,
//      ),
//    ),
//  );
//}