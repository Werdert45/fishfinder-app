import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishfinder_app/models/species.dart';


class RecentScroll extends StatelessWidget {
  final List<Species> species;
  RecentScroll({Key key, this.species}) : super(key: key);

  String uid;

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: Firestore.instance.collection('fish_catches').where('uid', isEqualTo: uid).snapshots(),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return new Center(child: new Text('Loading'));
        }
        return Container(
          height: 130,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.documents[0]['species'].length,
            itemBuilder: (BuildContext context, int index) {
              return new Column(
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

                              image: AssetImage('assets/images/preview/' + species[(snapshot.data.documents[0]['species'][snapshot.data.documents[0]['species'].length - index - 1] - 1)].name.toLowerCase() + '.jpg'),
                              fit: BoxFit.fill
                          )
                      )
                  ),
                  Container(
                    width: 100,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 0),
                      child: Text(showPreviewString(species[(snapshot.data.documents[0]['species'][snapshot.data.documents[0]['species'].length - index - 1] - 1)].name, 12), textAlign: TextAlign.left)
                  ),
                ],
              );
            }
          )
        );
      }
    );
  }
}

//species[(snapshot.data.documents[0]['species'][index] - 1)].name