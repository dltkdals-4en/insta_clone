import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clone/models/firestore/user_model.dart';

class Transformers {
  final toUser = StreamTransformer<DocumentSnapshot, UserModel>.fromHandlers(
      handleData: (snapshot, sink) async {
    sink.add(UserModel.fromSnapshot(snapshot));
  });
  final toUsersExceptMe =
      StreamTransformer<QuerySnapshot, List<UserModel>>.fromHandlers(
          handleData: (snapshot, sink) async {
    List<UserModel> users = [];
    FirebaseUser _firebaseUser = await FirebaseAuth.instance.currentUser();

    snapshot.documents.forEach((documentSnapshot) {
      if (_firebaseUser.uid != documentSnapshot.documentID)
        users.add(UserModel.fromSnapshot(documentSnapshot));
    });

    sink.add(users);
  });
}
