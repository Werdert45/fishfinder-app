import 'package:flutter/material.dart';
import 'package:fishfinder_app/services/auth.dart';
import 'package:fishfinder_app/screens/home/camera/camerascreen.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('App'),
        backgroundColor: Colors.lightBlueAccent,
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
      body: Stack(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          backgroundColor: Colors.lightBlueAccent,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),

            BottomNavigationBarItem(
                icon: Visibility(
                    visible: false,
                    child: Icon(Icons.delete_forever)
                ),
                title: Visibility(
                    visible: false,
                    child: Text('Invisible')
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet),
                title: new Text('FishDex')
            )
          ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        child: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.camera_alt, size:30, color: Colors.white),
          onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen(widget.cameras)));
          },

        ),
        margin: const EdgeInsets.only(top: 30.0),
      )
    );
  }
}

