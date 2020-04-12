import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/models/species.dart';
import 'package:fishfinder_app/screens/home/species/species.dart';
import 'dart:core';
import 'package:fishfinder_app/shared/constants.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SpeciesList extends StatelessWidget {
  final List<Species> species;
  SpeciesList({Key key, this.species}) : super(key: key);

  var speciesCaught = [1,2,3,5,5,5,5,6,5,55,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,];


  @override
  Widget build(BuildContext context) {
    double progressCaught = (speciesCaught.length / 64)*100;


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
                    gradient: linearGradient),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: (MediaQuery.of(context).size.width - 220),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
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
                    CircularPercentIndicator(
                      radius: (MediaQuery.of(context).size.width - 300),
                      lineWidth: 20,
                      percent: speciesCaught.length/64,
                      center: new Text((progressCaught.toString()).substring(0,4) + "%", style: TextStyle(fontSize: 15)),
                      progressColor: Colors.green,
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
                  if(speciesCaught.contains(index)) {

                    return new GestureDetector(
                        child: new Container(
                          padding: const EdgeInsets.all(15.0),
                          child: new GradientCard(
                            gradient: linearGradient,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 5.0,
                              child: new Container(
                                  alignment: Alignment.center,
                                  child: new Column(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/preview/' + species[index].name.toLowerCase() + '.jpg',
                                        height: 130,
                                      ),
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
                  }

                  else {
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
                                      Image.asset(
                                        'assets/images/preview/' +
                                            species[index].name.toLowerCase() +
                                            '.jpg',
                                        height: 130,
                                      ),
                                      Text.rich(
                                          TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(text: "#"),
                                                TextSpan(text: species[index]
                                                    .number),
                                                TextSpan(text: " "),
                                                TextSpan(
                                                    text: species[index].name),

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
                  }

                }),
            SizedBox(height: 50)
          ],
        )


    );
  }

}