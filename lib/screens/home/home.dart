import 'package:flutter/material.dart';
import 'package:fishfinder_app/services/auth.dart';
import 'package:fishfinder_app/screens/home/camera/helpers/camerascreen.dart';
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

  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('App'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text('logout')
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera_alt),
        onPressed:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen(widget.cameras)));
        },

      ),
    );
  }
}

