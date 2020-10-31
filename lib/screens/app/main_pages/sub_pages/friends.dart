import 'package:flutter/material.dart';

class FriendsScreen extends StatefulWidget {
  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 60, child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {Navigator.pop(context);})),
                  SizedBox(width: 140, child: Text("Friends", style: TextStyle(fontSize: 28))),
                  SizedBox(width: 0)
                    ],
              )
            ],
          ),
        ),
      )
    );
  }
}
