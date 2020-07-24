import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:net_ninja_brew/models/brew.dart';
import 'package:net_ninja_brew/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //Collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .document(uid)
        .setData({'sugars': sugars, 'name': name, 'strength': strength});
  }

  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((document) {
      return Brew(
          name: document.data['name'],
          strength: document.data['strength'],
          sugars: document.data['sugars']);
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        sugars: snapshot.data['sugars'],
        name: snapshot.data['name'],
        strength: snapshot.data['strength']);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
   