import 'dart:async';

import 'package:medicine_scheduler/src/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/resources/Authenticate.dart';

class UserApiProvider {

  final CollectionReference collection = Firestore.instance.collection(kUserTable);

  Future<Map<String, dynamic>> fetchUser() async{
    String uid = await auth.getUid();
    if(uid != null) {
      DocumentSnapshot snapshot = await collection.document(uid).get();
      if(snapshot.exists) {
        return snapshot.data;
      }
    }
    return null;
  }

  void addUser(User user) async{
    await collection.document(user.uid).setData(user.toFireBaseMap());
  }
}