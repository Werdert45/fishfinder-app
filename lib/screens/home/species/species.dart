import 'package:flutter/material.dart';
import 'package:fishfinder_app/screens/home/camera/camerascreen.dart';
import 'package:camera/camera.dart';

// @author Ian Ronk
// @class Species

class SpeciesScreen extends StatefulWidget {
  final String species;
  SpeciesScreen({Key key, this.species}) : super(key: key);

  @override
  _SpeciesScreenState createState() => _SpeciesScreenState();
}

class _SpeciesScreenState extends State<SpeciesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(super.species),
          backgroundColor: Colors.lightBlueAccent,
          elevation: 0.0,

        ),
        body: SingleChildScrollView(
            child: Stack(
                children: <Widget>[Column(
                  children: <Widget>[
                    Image(image: AssetImage('assets/images/pikefront.jpg')),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.adb),
                                SizedBox(width: 5),
                                Text("Esox Lucius", style: TextStyle(fontSize: 14))
                              ],
                            ),
                            SizedBox(width: 30),
                            Row(
                              children: <Widget>[
                                Icon(Icons.assignment_turned_in),
                                SizedBox(width: 5),
                                Text("Not Caught", style: TextStyle(fontSize: 14))
                              ],
                            ),
                            SizedBox(width: 30),
                            Row(
                              children: <Widget>[
                                Icon(Icons.fastfood),
                                SizedBox(width: 5),
                                Text("Not Edible", style: TextStyle(fontSize: 14))
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
                                Text("Least Concern", style: TextStyle(fontSize: 14))
                              ],
                            ),
                            SizedBox(width: 15),
                            Row(
                              children: <Widget>[
                                Icon(Icons.wb_sunny),
                                SizedBox(width: 5),
                                Text("Apr - Sept", style: TextStyle(fontSize: 14))
                              ],
                            ),
                            SizedBox(width: 40),
                            Row(
                              children: <Widget>[
                                Icon(Icons.explore),
                                SizedBox(width: 5),
                                Text("138cm/4.6ft", style: TextStyle(fontSize: 14))
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
                              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id rhoncus nibh, id convallis nisl. "
                                  "Etiam vulputate enim nulla, ac cursus sem sollicitudin a. Nulla rutrum ex eu ornare condimentum. Pellentesque mattis mollis libero a vehicula. "
                                  "Duis mi risus, faucibus a gravida vel, vehicula id felis. Mauris faucibus, velit a sollicitudin pulvinar, eros quam luctus purus, non laoreet magna "
                                  "ipsum sollicitudin lorem. Nullam congue quam ac pretium viverra. Donec hendrerit pulvinar nisi, ac viverra eros porta a. Phasellus imperdiet neque massa, "
                                  "sit amet vestibulum leo dapibus sit amet. Integer interdum nisi at consectetur dapibus. Vivamus vulputate sapien a blandit semper. Proin sapien ipsum, "
                                  "placerat eu aliquam non, dapibus sit amet velit. Fusce dui massa, lobortis vitae condimentum quis, "
                                  "lobortis nec dui. Cras feugiat, elit vitae condimentum lobortis, nisl odio semper lorem, quis eleifend dolor justo nec felis. "
                                  "Praesent sed finibus felis. Sed porttitor neque lobortis odio hendrerit pretium porttitor non eros. In ipsum dolor, semper vitae lacus eget, "
                                  "tincidunt vestibulum mauris. Curabitur ut ipsum convallis urna laoreet scelerisque. Quisque volutpat massa ac nunc volutpat imperdiet. "
                                  "Curabitur quis rhoncus ipsum, eu dictum nisi. Vivamus molestie viverra lectus, vitae cursus est lacinia ac. Maecenas pellentesque massa id fermentum placerat."),
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
