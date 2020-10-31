import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishfinder_app/models/user.dart';

// TODO get all recent catches from the database and all of the species

// @author Ian Ronk
// @class DatabaseService
class Streams {

  final String uid;
  Streams({ this.uid});

  // collection reference
  final CollectionReference usersCollection = Firestore.instance.collection('users');

  Stream<QuerySnapshot> get users {
    return usersCollection.snapshots();
  }

  Stream get UserData {
    return usersCollection.document(uid).snapshots();
  }
}

class DatabaseService {

  final String uid;

  DatabaseService({ this.uid});

  final CollectionReference usersCollection = Firestore.instance.collection('users');


  Future createUser(puid, name, email) async {
    await usersCollection.document(puid).setData({
      'uid': puid,
      'name': name,
      'email': email,
      'friends': {},
      'friend_request': {},
      'catch_record': {},
      'updates': {},
      'pending_friends': {}
    });
  }

  Future addUpdate(puid, type, friend_uid, friend_name, species_int) async {
    var data = await usersCollection.document(puid).get();
    var complete_user = CompleteUser.fromMap(data.data);
    var updates = complete_user.updates;
    var now = DateTime.now().millisecondsSinceEpoch.toString();

    updates[now] = [type, friend_uid, friend_name, species_int];

    await usersCollection.document(puid).updateData({
      'updates': updates
    });
  }
}

