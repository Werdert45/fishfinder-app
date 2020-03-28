import 'package:flutter/material.dart';
import 'package:fishfinder_app/services/auth.dart';
import 'package:fishfinder_app/screens/home/camera/camerascreen.dart';
import 'package:camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings.dart';

// @author Ian Ronk
// @class MainMenu

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
  Widget _options() {
  }

  Widget _fishdexButton() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/fishdex');
      },
      child: Container(
        width: 85,
        padding: EdgeInsets.symmetric(vertical: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Check now',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                  child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(height: 40),
                            // placeholder, will be a loop for all elements in DB
                            Container(
                                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: (MediaQuery.of(context).size.width - 10),
                                    child: Row(
                                    children: <Widget>[
                                      RichText(
                                      text: TextSpan(
                                          text: 'Hi,',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 35),
                                          children: <TextSpan>[
                                            TextSpan(text: ' Ian',
                                                style: TextStyle(
                                                    color: Colors.black, fontSize: 35, fontWeight: FontWeight.w500)
                                            )]
                                      ),
                                    ),
                                      SizedBox(width: (MediaQuery.of(context).size.width - 190)),
                                      IconButton(
                                        icon: Icon(Icons.settings),
                                        onPressed: () {
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => SettingsPage())
                                          );
                                        }
                                      )
                                    ]
                                )
                                )
                            ),
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

                            SizedBox(height: 20),

                            Container(
                                width: (MediaQuery.of(context).size.width - 20),
                                height: 180,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          offset: Offset(2, 4),
                                          blurRadius: 5,
                                          spreadRadius: 2)
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              width: 200,
                                              child: Text("Check out catches      in your FishDex", textAlign: TextAlign.left, textDirection: TextDirection.ltr ,style: TextStyle(fontSize: 20, color: Colors.white)),
                                            )
                                        ),
                                        SizedBox(width: 100),

                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: <Widget>[
                                        _fishdexButton()
                                      ],
                                    )
                                  ],
                                )
                            ),
                            SizedBox(height: 20),


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
                            SizedBox(height: 85),
                          ],
                        ),

                      ]
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
                                    child: IconButton(icon: Icon(Icons.home, color: Colors.white, size: 35, semanticLabel: 'Home'))),
                                new Container(
                                    margin: const EdgeInsets.only(right: 20, bottom: 5),
                                    child:IconButton(icon: Icon(Icons.book, color: Colors.white, size: 35, semanticLabel: 'FishDex',), onPressed: () {
                                      // Put the fishdex  screen on top of homescreen
                                      Navigator.pushNamed(context, '/fishdex');
                                    }
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
              // Put camera screen on top of home screen and pass camera down
              Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen(widget.cameras)));
            },
          ),
        )
    );
  }
}

