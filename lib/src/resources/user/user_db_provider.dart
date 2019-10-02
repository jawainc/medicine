import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:medicine_scheduler/src/models/User.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/resources/DBTables.dart';


class UserDbProvider {
  String _table = kUserTable;

  Future<User> fetchUser() async{
    var db = await database.open();
    final results = await db.query(
      _table,
      columns: null
    );

    if(results.length > 0) {
      return User.fromDb(results.first);
    }

    return null;
  }

  Future<int> addUser(User user) async{
    var db = await database.open();
    return db.insert(_table, user.toMap());
  }

  Future<int> addFireBaseCredentialUser(FirebaseUser user) async{
    User fireBaseUser = User.fromFireBaseCredential(user);
    var db = await database.open();
    return db.insert(_table, fireBaseUser.toMap());
  }
}