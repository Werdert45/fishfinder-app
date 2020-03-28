import 'package:flutter/material.dart';
import 'package:fishfinder_app/screens/home/camera/camerascreen.dart';
import 'package:camera/camera.dart';
import 'dart:core';
import 'package:fishfinder_app/models/species.dart';
import 'package:fishfinder_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

// @author Ian Ronk
// @class Species

class PreviewSpeciesScreen extends StatefulWidget {
  final String single_species;
  PreviewSpeciesScreen({Key key, @required this.single_species}) : super(key: key);

  @override
  _PreviewSpeciesScreenState createState() => _PreviewSpeciesScreenState();
}

class _PreviewSpeciesScreenState extends State<PreviewSpeciesScreen> {
  @override
  Widget build(BuildContext context) {

    final Species species = ModalRoute.of(context).settings.arguments;

    Future currentUser() async {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      var database = DatabaseService();
      database.updateSpeciesList(user.uid, int.parse(species.number));
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(species.name),
          backgroundColor: Colors.lightBlueAccent,
          elevation: 0.0,
          actions: <Widget>[
            Row(
              children: <Widget>[
                OutlineButton(
                  child: Row(
                    children: <Widget>[
                      Text('Add'),
                      SizedBox(width: 5),
                      Icon(Icons.add)
                    ],
                  ),
                  onPressed: () {
                    currentUser();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/fishdex');
                  },
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.orange,
                ),
                SizedBox(width: 10)
              ],
            )

          ],

        ),
        body: SingleChildScrollView(
            child: Stack(
                children: <Widget>[Column(
                  children: <Widget>[
                    Image.asset('assets/images/preview/' + species.name.toLowerCase() + '.jpg', width:  MediaQuery.of(context).size.width),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.adb),
                                SizedBox(width: 5),
                                Text(species.latin_name, style: TextStyle(fontSize: 14))
                              ],
                            ),
                            SizedBox(width: 30),
                            Row(
                              children: <Widget>[
                                Icon(Icons.assignment_turned_in),
                                SizedBox(width: 5),
                                Text(species.catch_state, style: TextStyle(fontSize: 14))
                              ],
                            ),
                            SizedBox(width: 30),
                            Row(
                              children: <Widget>[
                                Icon(Icons.fastfood),
                                SizedBox(width: 5),
                                Text(species.edible, style: TextStyle(fontSize: 14))
                              ],
                            )
                          ],
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.equalizer),
                                SizedBox(width: 5),
                                Text(species.conservation_state, style: TextStyle(fontSize: 14))
                              ],
                            ),
                            SizedBox(width: 15),
                            Row(
                              children: <Widget>[
                                Icon(Icons.wb_sunny),
                                SizedBox(width: 5),
                                Text(species.catch_time, style: TextStyle(fontSize: 14))
                              ],
                            ),
                            SizedBox(width: 40),
                            Row(
                              children: <Widget>[
                                Icon(Icons.explore),
                                SizedBox(width: 5),
                                Text(species.length, style: TextStyle(fontSize: 14))
                              ],
                            )
                          ],
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text("General information", style: TextStyle(fontSize: 18))
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(species.general_information),
                            )
                          ],
                        )
                    )


                  ],
                ),
                ]
            )
        )
    );
  }
}