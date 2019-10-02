import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:medicine_scheduler/src/resources/user/user_api_provider.dart';
import 'package:medicine_scheduler/src/resources/user/user_db_provider.dart';
import 'package:medicine_scheduler/src/models/User.dart';
import 'package:medicine_scheduler/src/resources/Authenticate.dart';


class UserResource {
  final UserDbProvider _db = UserDbProvider();
  final UserApiProvider _api = UserApiProvider();

  Future<bool> isUserExist() async{
    User dbUser = await _db.fetchUser();

    if(dbUser != null) {
      return true;
    }

    bool loggedIn = await auth.isLoggedIn();
    if(loggedIn) {
      Map<String, dynamic> apiUser = await _api.fetchUser();
      if(apiUser != null) {
        User user = User.fromJson(apiUser);
        _db.addUser(user);
        return true;
      } else {
        FirebaseUser fbUser = await auth.getUser();
        addFireBaseCredential(fbUser);
        return true;
      }
    } else {
      return false;
    }

  }

  void addFireBaseCredential(FirebaseUser fbUser) async{
    User user = User.fromFireBaseCredential(fbUser);
    _db.addFireBaseCredentialUser(fbUser);
    _api.addUser(user);
  }

}

final user = UserResource();