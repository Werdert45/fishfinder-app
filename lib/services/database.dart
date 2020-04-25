import 'package:cloud_firestore/cloud_firestore.dart';

// TODO get all recent catches from the database and all of the species

// @author Ian Ronk
// @class DatabaseService
class Streams {

  final String uid;
  Streams({ this.uid});

  // collection reference
  final CollectionReference fishCatchesCollection = Firestore.instance.collection('fish_catches');


  Stream<DocumentSnapshot> get fishCatches {
    return fishCatchesCollection.document(uid).snapshots();
  }
}

class DatabaseService {

  final String uid;

  DatabaseService({ this.uid});

  // collection reference
  final CollectionReference fishCatchesCollection = Firestore.instance
      .collection('fish_catches');

  final CollectionReference generalInformationCollection = Firestore.instance.collection('general_information');


  Future updateName(name, puid) async {
    await fishCatchesCollection.document(puid).updateData({
      'name': name
    });

    await generalInformationCollection.document('IOpIw5GzEBdFtx7jHUqz').updateData({
      'users': FieldValue.arrayUnion([{puid: name}])
    });
  }

  Future updateEmail(email, puid) async {
    await fishCatchesCollection.document(puid).updateData({
      'email': email
    });
  }

  Future updateLanguage(language, puid) async {
    await fishCatchesCollection.document(puid).updateData({
      'language': language
    });
  }

  Future addFriends(friend_name, friend_id, uid) async {
    await fishCatchesCollection.document(uid).updateData({
      'friends_id': FieldValue.arrayUnion([friend_id]),
      'friends_name': FieldValue.arrayUnion([friend_name])
    });
  }

  Future addSpeciesToFriends(friends, data) async {
    for (int i = 0; i < friends.length; i++) {
      await fishCatchesCollection.document(friends[i]).updateData({
        'friends_catches': {DateTime
            .now()
            .millisecondsSinceEpoch
            .toString(): [data[0], data[1]]}
      });
    }
  }

  Future updateAchievement(achievement, puid) async {
    await fishCatchesCollection.document(puid).updateData({
      'achievements': FieldValue.arrayRemove([achievement]),
      'achievements': FieldValue.arrayUnion([{achievement: true}])
    });
  }

  Future addNameUser(String name) async {
    return await fishCatchesCollection.document(uid).setData({
      'name': name
    });
  }

  Future updateUserData(String email, List species, String name) async {
    await generalInformationCollection.document('IOpIw5GzEBdFtx7jHUqz').setData({
      'users': FieldValue.arrayUnion([{uid: name}])
    });

    return await fishCatchesCollection.document(uid).setData({
      'email': email,
      'uid': uid,
      'species': [],
      'friends_catches': {},
      'friends_id': [],
      'friends_name': [],
      'language': "en",
      'achievements': [
        {"achievement_1": false},
        {"achievement_2": false},
        {"achievement_3": false},
        {"achievement_4": false},
        {"achievement_5": false},
        {"achievement_6": false},
        {"achievement_7": false},
        {"achievement_8": false}
        ]
    });
  }

  Future registerOthers(String firstName, String lastName,
      bool premiumUser) async {
    return await fishCatchesCollection.document(uid).setData({
      'firstname': firstName,
      'surname': lastName,
      'premium': premiumUser
    });
  }

  Future updateSpeciesList(currentUser, newSpecies) async {
    return await fishCatchesCollection.document(currentUser).updateData({
      'species': FieldValue.arrayUnion([{DateTime.now().millisecondsSinceEpoch.toString(): newSpecies}])
    });
  }
}
