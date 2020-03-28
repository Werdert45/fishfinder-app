import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/models/species.dart';
import 'dart:convert';
import 'package:fishfinder_app/screens/home/fishdex/list.dart';
import 'package:fishfinder_app/screens/home/camera/camerascreen.dart';
import 'package:fishfinder_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FishDex extends StatefulWidget {
  final List<CameraDescription> cameras;
  FishDex(this.cameras);

  @override
  _FishDexState createState() => _FishDexState();
}

class _FishDexState extends State<FishDex> {

  List data;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().fishCatches,
    child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[

            new Container(
            child: Center(
                child: new FutureBuilder(
                    future: DefaultAssetBundle.of(context).loadString('assets/json/species.json'),
                    builder: (context, snapshot) {
                      List<Species> species = parseJSON(snapshot.data.toString());
                      return species.isNotEmpty
                          ? new SpeciesList(species: species)
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
                                  child: IconButton(icon: Icon(Icons.home, color: Colors.grey, size: 35, semanticLabel: 'Hello'), onPressed: () {
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen(widget.cameras)));
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
    print(json.decode(response.toString()));
    final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Species>((json) => new Species.fromJSON(json)).toList();
  }
}
