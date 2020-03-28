import 'package:cloud_firestore/cloud_firestore.dart';

// TODO get all recent catches from the database and all of the species

// @author Ian Ronk
// @class DatabaseService

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid});

  // collection reference
  final CollectionReference fishCatchesCollection = Firestore.instance.collection('fish_catches');


  Future updateUserData(String email, List species) async {
    return await fishCatchesCollection.document(uid).setData({
      'email': email,
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