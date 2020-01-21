import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:fishfinder_app/screens/home/camera/camerapreview.dart';

// A screen that allows users to take a picture using a given camera.
class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
//
//  const TakePictureScreen({
//    Key key,
//    @required this.camera,
//  }) : super(key: key);
  CameraScreen(this.cameras);

  @override

  CameraScreenState createState() {
    return new CameraScreenState();
  }
}

class CameraScreenState extends State<CameraScreen> {
  CameraController controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.cameras[0],
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: Stack(children: <Widget>[
        FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the preview.
              return CameraPreview(controller);
            } else {
              // Otherwise, display a loading indicator.
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        Container(
         margin: const EdgeInsets.only(left: 10.0, top: 20.0),
         child: IconButton(
             tooltip: "Go Back",
             icon: new Icon(Icons.clear, color: Colors.white, size: 30.0),
             onPressed: () {
               Navigator.pop(context);
             }
         ),
        ),

        Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                      margin: const EdgeInsets.only(left: 20, bottom: 20),
                      child: IconButton(icon: Icon(Icons.switch_camera, color: Colors.white, size: 30, semanticLabel: 'Hello'), onPressed: () {
                        // Flip camera
                      })),
                  new Container(
                      margin: const EdgeInsets.only(right: 20, bottom: 20),
                      child:IconButton(icon: Icon(Icons.image, color: Colors.white, size: 30), onPressed: () {
                        Navigator.pushNamed(context, '/camera');
                      }))
                ])),
      ]),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        child: Center(child:Icon(Icons.camera_alt, size:40, color: Colors.white)),
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Construct the path where the image should be saved using the
            // pattern package.
            final path = join(
              // Store the picture in the temp directory.
              // Find the temp directory using the `path_provider` plugin.
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved.
            await controller.takePicture(path);

            // If the picture was taken, display it on a new screen.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
      ),
    );
  }
}

