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

  Future sendFriendRequest(puid, friend_uid) async {
    var user_1 = await usersCollection.document(puid).get();
    var complete_user_1 = CompleteUser.fromMap(user_1.data);

    var user_2 = await usersCollection.document(friend_uid).get();
    var complete_user_2 = CompleteUser.fromMap(user_2.data);

    var pending_map = complete_user_1.pending_friends;
    var request_map = complete_user_2.friend_request;

    pending_map[friend_uid] = complete_user_2.name;
    request_map[puid] = complete_user_1.name;

    // Set the update for the User 2, to receive
    var updates_map = complete_user_2.updates;
    var now = DateTime.now().millisecondsSinceEpoch.toString();

    updates_map[now] = [2, friend_uid, complete_user_2.name, null];

    // Set the Pending Friends of User 1 to contain the User 1
    await usersCollection.document(puid).updateData({
      'pending_friends': pending_map
    });

    // Set the Friend Requests of User 2 to contain the User 1
    // Set the update
    await usersCollection.document(friend_uid).updateData({
      'friend_request': request_map,
      'updates': updates_map
    });
  }
}

