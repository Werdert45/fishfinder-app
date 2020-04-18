import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishfinder_app/models/users_db.dart';
import 'package:fishfinder_app/screens/home/homescreen/friends_search.dart';
import 'package:flutter/material.dart';


class FriendsPage extends StatefulWidget {
  final String uid;
  FriendsPage({Key key, this.uid}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: StreamBuilder(
              stream: Firestore.instance.collection('fish_catches').where(
                'uid', isEqualTo: widget.uid).snapshots(),
              builder: (BuildContext context, snapshot) {
                var friends_added = snapshot.data.documents[0]['friends_name'];


                if (!snapshot.hasData) {
                  return new Center(child: new Text('Loading ...'));
                }

                return Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    Container(
                      width: (MediaQuery.of(context).size.width - 40),
                      padding: EdgeInsets.only(bottom: 20),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          Text("Friends", style: TextStyle(fontSize: 25)),
                          SizedBox(width: MediaQuery.of(context).size.width - 175),
                          StreamBuilder(
                            stream: Firestore.instance.collection('general_information').document('IOpIw5GzEBdFtx7jHUqz').snapshots(),
                            builder: (context, snapshot) {
                              // Make an if statement if data is not present (also check the friends again)

                              var map = snapshot.data['users'];
                              var users = [];



                              map.forEach((k, v) => users.add(usersDB(k, v).list()));

                              return Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                    icon: Icon(Icons.add, size: 25),
                                    onPressed: () {
                                      showSearch(
                                          context: context,
                                          delegate: FriendsSearch([users, widget.uid, friends_added])
                                      );
                                    }
                                ),
                              );
                            }
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("All Friends", style: TextStyle(fontSize: 16),)
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width - 120,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                          itemCount: snapshot.data.documents[0]['friends_name'].length,
                          itemBuilder: (context, int index) {
                            return ListTile(
                              title: Text(snapshot.data.documents[0]['friends_name'][index]),
                              leading: Icon(Icons.account_box)
                            );
                          }
                      )
                    )



                  ],
                );
              }
          )
        )
      ],
    )
    );
  }
}
