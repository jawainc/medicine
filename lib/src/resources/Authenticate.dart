import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Authenticate {

  final _auth = FirebaseAuth.instance;
  FirebaseUser user;

  Future<bool> isLoggedIn() async{
    try{
      user = await _auth.currentUser();
      if(user == null) {
        return false;
      } else {
        return true;
      }
    } catch(e) {
      return false;
    }
  }

  Future<FirebaseUser> getUser() async{
    try{
      user = await _auth.currentUser();
      return user;
    } catch(e) {
      return null;
    }
  }

  Future<String> getUid() async{
    try{
      user = await _auth.currentUser();
      if(user == null) {
        return null;
      } else {
        return user.uid;
      }
    } catch(e) {
      return null;
    }
  }

  Future<Map<String, dynamic>> registerWithEmailPassword(String email, String password) async{
    try {
      user = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      if(user != null) {
        return {
          'status': true,
          'user': user
        };
      } else {
        return {
          'status': false,
          'user': null
        };
      }

    } on PlatformException catch(e) {
      return {
        'status': false,
        'message': e.message
      };
    }
  }

Future<Map<String, dynamic>> loginWithEmailPassword(String email, String password) async{
    try {
      user = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      if(user != null) {
        return {
          'status': true,
          'user': user
        };
      } else {
        return {
          'status': false,
          'user': null
        };
      }

    } on PlatformException catch(e) {
      return {
        'status': false,
        'message': e.message
      };
    }
  }  

}

final auth = Authenticate();