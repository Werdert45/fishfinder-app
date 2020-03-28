import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/models/species.dart';
import 'package:fishfinder_app/screens/home/species/species.dart';
import 'dart:core';

class SpeciesList extends StatelessWidget {
  final List<Species> species;
  SpeciesList({Key key, this.species}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Container(
                width: (MediaQuery.of(context).size.width - 20),
                height: 180,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                              child: Text("Fishdex", textAlign: TextAlign.left, textDirection: TextDirection.ltr ,style: TextStyle(fontSize: 20, color: Colors.white)),
                            )
                        ),
                        SizedBox(width: 100),

                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text('Latest Catch:', textAlign: TextAlign.left, textDirection: TextDirection.ltr ,style: TextStyle(fontSize: 16, color: Colors.white))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('#014 Snoekbaars', textAlign: TextAlign.left, textDirection: TextDirection.ltr ,style: TextStyle(color: Colors.blueGrey))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text('Most frequent catch:', textAlign: TextAlign.left, textDirection: TextDirection.ltr ,style: TextStyle(fontSize: 16, color: Colors.white))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('#062 Regenboogkarper', textAlign: TextAlign.left, textDirection: TextDirection.ltr ,style: TextStyle(color: Colors.blueGrey))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('5 time(s)', textAlign: TextAlign.left, textDirection: TextDirection.ltr ,style: TextStyle(color: Colors.blueGrey))
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                      ],
                    )
                  ],
                )
            ),
            GridView.builder(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: species == null ? 0 : species.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {

                  return new GestureDetector(
                      child: new Container(
                        padding: const EdgeInsets.all(15.0),
                        child: new Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5.0,
                            child: new Container(
                                alignment: Alignment.center,
                                child: new Column(
                                  children: <Widget>[
                                    Image(image: AssetImage('assets/images/' + species[index].name.toLowerCase() + '.jpg')),
                                    Text.rich(
                                        TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(text: "#"),
                                              TextSpan(text: species[index].number),
                                              TextSpan(text: " "),
                                              TextSpan(text: species[index].name),

                                            ]
                                        )
                                    ),
                                  ],
                                )

                            )
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SpeciesScreen(),
                            settings: RouteSettings(
                                arguments: species[index]
                            )
                        )
                        );
                      }
                  );

                })
          ],
        )


    );
  }

}