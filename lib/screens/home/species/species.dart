import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/models/preview_species.dart';
import 'dart:convert';
import 'package:fishfinder_app/screens/home/species/list.dart';


class SpeciesPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  SpeciesPage(this.cameras);

  @override
  _SpeciesPageState createState() => _SpeciesPageState();
}

class _SpeciesPageState extends State<SpeciesPage> {

  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children:<Widget>[Icon(Icons.adb, size:30), SizedBox(width: 20), Text("Fishdex")]),
          backgroundColor: Colors.lightBlueAccent,
          elevation: 0.0,
        ),
      body: Stack(
        children: <Widget>[
          new Center(
              child: new FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString('assets/json/preview_species.json'),
                  builder: (context, snapshot) {
                    List<previewSpecies> species = parseJSON(snapshot.data.toString());
                    return !species.isEmpty
                        ? new SpeciesList(species: species)
                        : new Center(child: new CircularProgressIndicator());
                  }
              )
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent
                  ),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                                margin: const EdgeInsets.only(left: 20, bottom: 5),
                                child: IconButton(icon: Icon(Icons.home, color: Colors.white, size: 35, semanticLabel: 'Hello'), onPressed: () {
                                  Navigator.pop(context);
                                }
                                )
                            ),

                            new Container(
                                margin: const EdgeInsets.only(right: 20, bottom: 5),
                                child:IconButton(icon: Icon(Icons.book, color: Colors.white, size: 35), onPressed: () {
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => SpeciesPage(cameras)));
                                },
                                )
                            )
                          ]
                      )
                  )
              )
          )
        ],
      )

    );
  }

  List<previewSpecies> parseJSON(String response) {
    if (response == null) {
      return [];
    }
    final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<previewSpecies>((json) => new previewSpecies.fromJSON(json)).toList();
  }
}
