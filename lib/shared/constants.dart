import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';

// @author Ian Ronk
// @constants textInputDecoration

// TODO insert these constants into the app and generalize styling

// STYLES
const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);

const linearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xff63d5fb), Color(0xff6bf2eb)]);


// FUNCTIONALITY
most_frequent(List list) {
  var map = Map();
  var new_list = List();
  var most_frequent = 0;
  int amount = 0;

  list.forEach((element) {
    if(!map.containsKey(element)) {
      map[element] = 1;
    }
    else {
      map[element] += 1;
    }
  });

  map.forEach((k,v) => new_list.add([k,v]));

  for (var i = 0; i < new_list.length; i++) {
    if (new_list[i][1] >= amount) {
      amount = new_list[i][1];
      most_frequent = new_list[i][0];
    }
  }

  return [most_frequent, amount, index_show];
}

index_show(int index) {
  String index_show;

  if (index < 10) {
    index_show = "00" + index.toString();
  }

  else {
    index_show = "0" + index.toString();
  }

  return index_show;
}

// Get the current users
getUser() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseUser user = await _auth.currentUser();
  String uid = user.uid;
  return uid.toString();
}

getSpeciesList() async {
  var document = Firestore.instance.collection('fish_catches').where(getUser().toString()).snapshots();

}