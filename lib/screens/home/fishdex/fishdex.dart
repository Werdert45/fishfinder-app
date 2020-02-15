import 'package:flutter/material.dart';
import 'package:fishfinder_app/screens/home/camera/camerascreen.dart';
import 'package:camera/camera.dart';
import 'package:fishfinder_app/screens/home/species/species.dart';

// @author Ian Ronk
// @class FishDex

class FishDex extends StatefulWidget {
  // Pass down cameras to Fishdex, to be able to pass it down to the camera
  final List<CameraDescription> cameras;
  FishDex(this.cameras);

  @override
  _FishDexState createState() => _FishDexState();
}

class _FishDexState extends State<FishDex> {
  @override
  void initState() {
    super.initState();
  }

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

            children: <Widget>[Column(
              children: <Widget>[
                SizedBox(height: 20),
                // Option 1
                Container(
                    margin: EdgeInsets.only(left: 10.0),

                    child: Align(
                        alignment: Alignment.centerLeft,
                            child: Row(
                              children: <Widget>[
                                Container(
                                    width: 200,
                                    height: 140,
                                    child: Card(
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 0),
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Text("Northern Pike", style: new TextStyle(fontSize: 14)),
                                                    SizedBox(width: 40),
                                                    Text("#001", style: new TextStyle(fontSize: 14))
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(

                                                      margin: EdgeInsets.only(bottom: 40),
                                                     width: 60,
                                                    child: Column(
                                                      children: <Widget>[
                                                        Container( width: 60, child: Text('152.4  cm', textAlign: TextAlign.left, style: new TextStyle(fontSize: 11))),
                                                        SizedBox(height: 4),
                                                        Container( width: 60, child: Text('27-01-2020', textAlign: TextAlign.left, style: new TextStyle(fontSize: 11))),
                                                        SizedBox(height: 4),
                                                        Container( width: 60, child: Text('Vinkeveen', textAlign: TextAlign.left, style: new TextStyle(fontSize: 11)))
                                                      ],
                                                    )),
                                                    Container(
                                                      margin: EdgeInsets.only(bottom: 12, top: 4),
                                                      width: 100,
                                                      height: 80,
                                                      child: Image(image: AssetImage('assets/images/pike1.png'))
                                                    )
                                                  ],
                                                )
                                              ],

                                            )
                                        )
                                    )
                                ),
                                Container(
                                    width: 200,
                                    height: 140,
                                    child: Card(
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 0),
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Text("Northern Pike", style: new TextStyle(fontSize: 14)),
                                                    SizedBox(width: 40),
                                                    Text("#001", style: new TextStyle(fontSize: 14))
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                        margin: EdgeInsets.only(bottom: 40),
                                                        width: 60,
                                                        child: Column(
                                                          children: <Widget>[
                                                            Container( width: 60, child: Text('152.4  cm', textAlign: TextAlign.left, style: new TextStyle(fontSize: 11))),
                                                            SizedBox(height: 4),
                                                            Container( width: 60, child: Text('27-01-2020', textAlign: TextAlign.left, style: new TextStyle(fontSize: 11))),
                                                            SizedBox(height: 4),
                                                            Container( width: 60, child: Text('Vinkeveen', textAlign: TextAlign.left, style: new TextStyle(fontSize: 11)))
                                                          ],
                                                        )),
                                                    Container(
                                                        margin: EdgeInsets.only(bottom: 12, top: 4),
                                                        width: 100,
                                                        height: 80,
                                                        child: Image(image: AssetImage('assets/images/pike1.png'))
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                        )
                                    )
                                ),
                              ],
                            )
                    )
                ),

                // Option 2
                Container(
                    margin: EdgeInsets.only(left: 10.0),

                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Container(
                                height: 100,
                                child: Card(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                                children: <Widget>[
                                                  Container( width: 90, child: Text("#003", style: new TextStyle(fontSize: 16.0), textAlign: TextAlign.left )),
                                                  Container( width: 90, child: Text("Silver Bream", textAlign: TextAlign.left)),
                                                  Container( width: 90, child: Text("54.8 cm")),
                                                  Container( width: 90, child: Text("09-02-2020"))
                                                ]),
                                            Image(image: AssetImage('assets/images/pike1.png'))
                                          ],

                                        )
                                    )
                                )
                            ),
                            Container(
                                height: 100,
                                child: Card(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                                children: <Widget>[
                                                  Container( width: 80, child: Text("#004", style: new TextStyle(fontSize: 16.0), textAlign: TextAlign.left )),
                                                  Container( width: 80, child: Text("Trout", textAlign: TextAlign.left)),
                                                  Container( width: 80, child: Text("23.5 cm")),
                                                  Container( width: 80, child: Text("29-12-2019"))
                                                ]),
                                            Image(image: AssetImage('assets/images/bitterling1.png'))
                                          ],
                                        )
                                    )
                                )
                            ),
                          ],
                        )
                    )
                ),

                // Option 3

                Container(
                    margin: EdgeInsets.only(left: 10.0),
                  width: 390,
                  height: 100,
                  child: Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 5),
                      child: Column(
                        children: <Widget>[

                          Container( width: 180, child: Text("Siberian Sturgeon", style: new TextStyle(fontSize: 16.0), textAlign: TextAlign.left )),
                          SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              Container( width: 100, child: Text("Length:", style: new TextStyle(fontSize: 12.0), textAlign: TextAlign.left )),
                              Container( width: 80, child: Text("356.3 cm", style: new TextStyle(fontSize: 12.0), textAlign: TextAlign.left )),
                            ],
                          ),

                          SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              Container( width: 100, child: Text("Catch Date: ", style: new TextStyle(fontSize: 12.0), textAlign: TextAlign.left )),
                              Container( width: 80, child: Text("27 Jan 2020", style: new TextStyle(fontSize: 12.0), textAlign: TextAlign.left )),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              Container( width: 100, child: Text("Catch Location:", style: new TextStyle(fontSize: 12.0), textAlign: TextAlign.left )),
                              Container( width: 80, child: Text("Vinkveen, NL", style: new TextStyle(fontSize: 12.0), textAlign: TextAlign.left )),
                            ],
                          ),
                        ],
                      )),

                      Column( children: <Widget>[
                        SizedBox(height: 5),
                        Container( width: 90, child: Text("#001", style: new TextStyle(fontSize: 16.0), textAlign: TextAlign.left )),
                        ]),
                      Image(image: AssetImage('assets/images/pike1.png'))
                    ],
                  ))
                ),

              ],
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SpeciesPage()));
                                    },
                                    )
                                )
                              ]
                          )
                      )
                  )
              ),
            ]
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
    );
  }
}

