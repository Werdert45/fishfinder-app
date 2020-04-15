import 'package:cloud_firestore/cloud_firestore.dart';

// TODO get all recent catches from the database and all of the species

// @author Ian Ronk
// @class DatabaseService

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid});

  // collection reference
  final CollectionReference fishCatchesCollection = Firestore.instance.collection('fish_catches');

  Future addNameUser(String name) async {
    return await fishCatchesCollection.document(uid).setData({
      'name': name
    });
  }

  Future updateUserData(String email, List species) async {
    return await fishCatchesCollection.document(uid).setData({
      'email': email,
      'uid': uid,
      'species': species
    });
  }

  Future registerOthers(String firstName, String lastName, bool premiumUser) async {
    return await fishCatchesCollection.document(uid).setData({
      'firstname': firstName,
      'surname': lastName,
      'premium': premiumUser
    });
  }

  Future updateSpeciesList(currentUser, newSpecies) async {
    return await fishCatchesCollection.document(currentUser).updateData({
      'species': FieldValue.arrayUnion([newSpecies])
    });
  }



//  // list of brews from snapshot
//  List<> _brewListFromSnapshot(QuerySnapshot snapshot) {
//    return snapshot.documents.map((doc) {
//      return Brew(
//          name: doc.data['name'] ?? '',
//          strength: doc.data['strength'] ?? 0,
//          sugars: doc.data['sugars'] ?? '0'
//      );
//    }).toList();
//  }

  // get brews stream
  Stream<QuerySnapshot> get fishCatches {
    return fishCatchesCollection.snapshots();
  }


}

//Column(
//children: <Widget>[
//Container(
//margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
//width: 100,
//height: 100,
//decoration: new BoxDecoration(
//borderRadius: new BorderRadius.all(const Radius.circular(30.0))
//),
//
//child: Stack(
//children: <Widget>[
//AspectRatio(
//
//aspectRatio: 1.0 / 1.0,
//child: Image(
//
//image: AssetImage('assets/images/fish9.jpg'),
//fit: BoxFit.fill
//)
//),
//Positioned(
//bottom: -3,
//right: -23,
//child: new RawMaterialButton(
//child: new Icon(
//Icons.person,
//color: Colors.blue,
//size: 15.0,
//),
//shape: new CircleBorder(),
//elevation: 2.0,
//fillColor: Colors.white,
//padding: const EdgeInsets.all(0.0),
//)),
//]),
//),
//Container(
//alignment: Alignment.centerLeft,
//margin: const EdgeInsets.only(right: 0),
//child: Text("Northern Pike", textAlign: TextAlign.left)
//),
//],
//),