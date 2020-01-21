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
          title: Row(children:<Widget>[Icon(Icons.adb, size:30), SizedBox(width: 20), Text("Fishfinder")]),
          backgroundColor: Colors.lightBlueAccent,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.keyboard_return, color: Colors.white),
              label: Visibility(
                child: Text(''),
                visible: false,
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: Container(

            child: Column(
              children: <Widget>[

                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    alignment: Alignment.centerLeft,
                    child: Container(
                        child: Text('Catches', style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.black))
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 10.0, bottom: 30, left: 20.0, right: 20.0),
                    height: 35,
                    child: TextField(
                        controller: null,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.search)
                        )
                    )
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                        child: Text('Recent Catches', style: new TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black))
                    )),
                // The row of recent catches
                Container(
                    margin: EdgeInsets.only(left: 10.0),

                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(


                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[

                                // Dummy data must create a loop to create these cards for every recent catch (max 10)

                                Column(
                                  children: <Widget>[
                                    Container(
                                        margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
                                        width: 100,
                                        height: 100,
                                        decoration: new BoxDecoration(
                                            borderRadius: new BorderRadius.all(const Radius.circular(30.0))
                                        ),

                                        child: AspectRatio(

                                            aspectRatio: 1.0 / 1.0,
                                            child: Image(

                                                image: AssetImage('assets/images/fish1.jpg'),
                                                fit: BoxFit.fill
                                            )
                                        )
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: const EdgeInsets.only(right: 0),
                                        child: Text("Northern Devil", textAlign: TextAlign.left)
                                    ),
                                  ],
                                ),


                                Column(
                                  children: <Widget>[
                                    Container(
                                        margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
                                        width: 100,
                                        height: 100,
                                        decoration: new BoxDecoration(
                                            borderRadius: new BorderRadius.all(const Radius.circular(30.0))
                                        ),

                                        child: AspectRatio(

                                            aspectRatio: 1.0 / 1.0,
                                            child: Image(

                                                image: AssetImage('assets/images/fish2.jpg'),
                                                fit: BoxFit.fill
                                            )
                                        )
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: const EdgeInsets.only(right: 0),
                                        child: Text("Rainbow Brass", textAlign: TextAlign.left)
                                    ),
                                  ],
                                ),

                                Column(
                                  children: <Widget>[
                                    Container(
                                        margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
                                        width: 100,
                                        height: 100,
                                        decoration: new BoxDecoration(
                                            borderRadius: new BorderRadius.all(const Radius.circular(30.0))
                                        ),

                                        child: AspectRatio(

                                            aspectRatio: 1.0 / 1.0,
                                            child: Image(

                                                image: AssetImage('assets/images/fish3.jpg'),
                                                fit: BoxFit.fill
                                            )
                                        )
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: const EdgeInsets.only(right: 0),
                                        child: Text("Sun karp", textAlign: TextAlign.left)
                                    ),
                                  ],
                                ),


                                Column(
                                  children: <Widget>[
                                    Container(
                                        margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
                                        width: 100,
                                        height: 100,
                                        decoration: new BoxDecoration(
                                            borderRadius: new BorderRadius.all(const Radius.circular(30.0))
                                        ),

                                        child: AspectRatio(

                                            aspectRatio: 1.0 / 1.0,
                                            child: Image(

                                                image: AssetImage('assets/images/fish4.jpg'),
                                                fit: BoxFit.fill
                                            )
                                        )
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: const EdgeInsets.only(right: 0),
                                        child: Text("Pikeperch", textAlign: TextAlign.left)
                                    ),
                                  ],
                                ),


                                Column(
                                  children: <Widget>[
                                    Container(
                                        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                                        width: 100,
                                        height: 100,
                                        decoration: new BoxDecoration(
                                            borderRadius: new BorderRadius.all(const Radius.circular(30.0))
                                        ),

                                        child: AspectRatio(

                                            aspectRatio: 1.0 / 1.0,
                                            child: Image(

                                                image: AssetImage('assets/images/fish5.jpg'),
                                                fit: BoxFit.fill
                                            )
                                        )
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: const EdgeInsets.only(right: 0),
                                        child: Text("Sun Brass", textAlign: TextAlign.left)
                                    ),
                                  ],
                                )


                              ],
                            )))),

                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 0.0),
                        child: Text("Friends' Catches", style: new TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black))
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10.0),

                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(


                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[

                                // Dummy data must create a loop to create these cards for every recent catch (max 10)

                                Column(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
                                      width: 100,
                                      height: 100,
                                      decoration: new BoxDecoration(
                                          borderRadius: new BorderRadius.all(const Radius.circular(30.0))
                                      ),

                                      child: Stack(
                                          children: <Widget>[
                                            AspectRatio(

                                                aspectRatio: 1.0 / 1.0,
                                                child: Image(

                                                    image: AssetImage('assets/images/fish6.jpg'),
                                                    fit: BoxFit.fill
                                                )
                                            ),
                                            Positioned(
                                                bottom: -3,
                                                right: -23,
                                                child: new RawMaterialButton(
                                                  child: new Icon(
                                                    Icons.person,
                                                    color: Colors.blue,
                                                    size: 15.0,
                                                  ),
                                                  shape: new CircleBorder(),
                                                  elevation: 2.0,
                                                  fillColor: Colors.white,
                                                  padding: const EdgeInsets.all(0.0),
                                                )),
                                          ]),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: const EdgeInsets.only(right: 0),
                                        child: Text("Tropical Brass", textAlign: TextAlign.left)
                                    ),
                                  ],
                                ),


                                Column(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
                                      width: 100,
                                      height: 100,
                                      decoration: new BoxDecoration(
                                          borderRadius: new BorderRadius.all(const Radius.circular(30.0))
                                      ),

                                      child: Stack(
                                          children: <Widget>[
                                            AspectRatio(

                                                aspectRatio: 1.0 / 1.0,
                                                child: Image(

                                                    image: AssetImage('assets/images/fish7.jpg'),
                                                    fit: BoxFit.fill
                                                )
                                            ),
                                            Positioned(
                                                bottom: -3,
                                                right: -23,
                                                child: new RawMaterialButton(
                                                  child: new Icon(
                                                    Icons.person,
                                                    color: Colors.blue,
                                                    size: 15.0,
                                                  ),
                                                  shape: new CircleBorder(),
                                                  elevation: 2.0,
                                                  fillColor: Colors.white,
                                                  padding: const EdgeInsets.all(0.0),
                                                )),
                                          ]),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: const EdgeInsets.only(right: 0),
                                        child: Text("African Bass", textAlign: TextAlign.left)
                                    ),
                                  ],
                                ),


                                Column(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
                                      width: 100,
                                      height: 100,
                                      decoration: new BoxDecoration(
                                          borderRadius: new BorderRadius.all(const Radius.circular(30.0))
                                      ),

                                      child: Stack(
                                          children: <Widget>[
                                            AspectRatio(

                                                aspectRatio: 1.0 / 1.0,
                                                child: Image(

                                                    image: AssetImage('assets/images/fish8.jpeg'),
                                                    fit: BoxFit.fill
                                                )
                                            ),
                                            Positioned(
                                                bottom: -3,
                                                right: -23,
                                                child: new RawMaterialButton(
                                                  child: new Icon(
                                                    Icons.person,
                                                    color: Colors.blue,
                                                    size: 15.0,
                                                  ),
                                                  shape: new CircleBorder(),
                                                  elevation: 2.0,
                                                  fillColor: Colors.white,
                                                  padding: const EdgeInsets.all(0.0),
                                                )),
                                          ]),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: const EdgeInsets.only(right: 0),
                                        child: Text("Clownfish", textAlign: TextAlign.left)
                                    ),
                                  ],
                                ),


                                Column(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
                                      width: 100,
                                      height: 100,
                                      decoration: new BoxDecoration(
                                          borderRadius: new BorderRadius.all(const Radius.circular(30.0))
                                      ),

                                      child: Stack(
                                          children: <Widget>[
                                            AspectRatio(

                                                aspectRatio: 1.0 / 1.0,
                                                child: Image(

                                                    image: AssetImage('assets/images/fish9.jpg'),
                                                    fit: BoxFit.fill
                                                )
                                            ),
                                            Positioned(
                                                bottom: -3,
                                                right: -23,
                                                child: new RawMaterialButton(
                                                  child: new Icon(
                                                    Icons.person,
                                                    color: Colors.blue,
                                                    size: 15.0,
                                                  ),
                                                  shape: new CircleBorder(),
                                                  elevation: 2.0,
                                                  fillColor: Colors.white,
                                                  padding: const EdgeInsets.all(0.0),
                                                )),
                                          ]),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: const EdgeInsets.only(right: 0),
                                        child: Text("Northern Pike", textAlign: TextAlign.left)
                                    ),
                                  ],
                                ),

                                Column(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
                                      width: 100,
                                      height: 100,
                                      decoration: new BoxDecoration(
                                          borderRadius: new BorderRadius.all(const Radius.circular(30.0))
                                      ),

                                      child: Stack(
                                          children: <Widget>[
                                            AspectRatio(

                                                aspectRatio: 1.0 / 1.0,
                                                child: Image(

                                                    image: AssetImage('assets/images/fish10.png'),
                                                    fit: BoxFit.fill
                                                )
                                            ),
                                            Positioned(
                                                bottom: -3,
                                                right: -23,
                                                child: new RawMaterialButton(
                                                  child: new Icon(
                                                    Icons.person,
                                                    color: Colors.blue,
                                                    size: 15.0,
                                                  ),
                                                  shape: new CircleBorder(),
                                                  elevation: 2.0,
                                                  fillColor: Colors.white,
                                                  padding: const EdgeInsets.all(0.0),
                                                )),
                                          ]),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: const EdgeInsets.only(right: 0),
                                        child: Text("Northern Pike", textAlign: TextAlign.left)
                                    ),
                                  ],
                                ),
                              ],
                            )))),
              ],
            )
        ),
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
                  icon: Icon(Icons.book),
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

