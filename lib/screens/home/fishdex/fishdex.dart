import 'package:camera/camera.dart';
import 'package:fishfinder_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/models/species.dart';
import 'dart:convert';
import 'package:fishfinder_app/screens/home/fishdex/list.dart';
import 'package:fishfinder_app/screens/home/camera/camerascreen.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FishDex extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String uid;
  final Map language;
  FishDex(this.cameras, this.uid, this.language);

  @override
  _FishDexState createState() => _FishDexState();
}

class _FishDexState extends State<FishDex> {
  @override

  List data;
  @override

  Widget build(BuildContext context) {

    var language = widget.language["fishdex"];

    return StreamProvider<QuerySnapshot>.value(
    child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            new Container(
            child: Center(
                child: new FutureBuilder(
                    future: DefaultAssetBundle.of(context).loadString('assets/json/species.json'),
                    builder: (context, snapshot) {

                      if (!snapshot.hasData) {
                        return new Center(child: new Text(language["loading"]));
                      }

                      List<Species> species = parseJSON(snapshot.data.toString());
                      return species.isNotEmpty
                          ? new SpeciesList(species: species, uid: widget.uid, language: language)
                          : new Center(child: new CircularProgressIndicator());
                    }
                )
            )
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                  margin: const EdgeInsets.only(left: 20, bottom: 5),
                                  child: IconButton(icon: Icon(Icons.home, color: Colors.grey, size: 35), onPressed: () {
                                    Navigator.pop(context);
                                  }
                                  )
                              ),
                              new Container(
                                  margin: const EdgeInsets.only(right: 20, bottom: 5),
                                  child:IconButton(icon: Icon(Icons.book, color: Colors.grey, size: 35), onPressed: () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => FishDex(cameras)));
                                  },
                                  )
                              )
                            ]
                        )
                    )
                )
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          child: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: const Icon(Icons.camera_alt, size:30, color: Colors.white),
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen(widget.cameras, widget.uid)));
            },
          ),
        )
    )
    );
  }

  List<Species> parseJSON(String response) {
    if (response == null) {
      return [];
    }
    final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Species>((json) => new Species.fromJSON(json)).toList();
  }
}
