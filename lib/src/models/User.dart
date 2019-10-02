import 'package:firebase_auth/firebase_auth.dart';

class User {

  final int id;
  final String uid;
  final String firstName;
  final String lastName;
  final String displayName;
  final String phoneNumber;
  final String photoUrl;
  final String email;
  final String age;
  final String gender;
  final String location;
  final String createdAt;
  final String updatedAt;



  User.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        uid = parsedJson['uid'],
        firstName = parsedJson['firstName'],
        lastName = parsedJson['lastName'],
        displayName = parsedJson['displayName'],
        phoneNumber = parsedJson['phoneNumber'],
        photoUrl = parsedJson['photoUrl'],
        email = parsedJson['email'],
        age = parsedJson['age'],
        gender = parsedJson['gender'],
        location = parsedJson['location'],
        createdAt = parsedJson['createdAt'].toDate().toString(),
        updatedAt = parsedJson['createdAt'].toDate().toString();

  User.fromDb(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        uid = parsedJson['uid'],
        firstName = parsedJson['firstName'],
        lastName = parsedJson['lastName'],
        displayName = parsedJson['displayName'],
        phoneNumber = parsedJson['phoneNumber'],
        photoUrl = parsedJson['photoUrl'],
        email = parsedJson['email'],
        age = parsedJson['age'],
        gender = parsedJson['gender'],
        location = parsedJson['location'],
        createdAt = parsedJson['createdAt'],
        updatedAt = parsedJson['updatedAt'];

  User.fromFireBaseCredential(FirebaseUser user)
    : id = 1,
      uid = user.uid,
      firstName = '',
      lastName = '',
      displayName = user.displayName,
      phoneNumber = user.phoneNumber,
      photoUrl = user.photoUrl,
      email = user.email,
      age = '',
      gender = '',
      location = '',
      createdAt = DateTime.now().toString(),
      updatedAt = DateTime.now().toString();



  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      "uid": uid,
      "firstName": firstName,
      "lastName": lastName,
      "displayName": displayName,
      "phoneNumber": phoneNumber,
      "photoUrl": photoUrl,
      "email": email,
      "age": age,
      "gender": gender,
      "location": location,
      "createdAt": createdAt,
      "updatedAt": updatedAt
    };
  }

  Map<String, dynamic> toFireBaseMap() {
    return <String, dynamic> {
      "uid": uid,
      "firstName": firstName,
      "lastName": lastName,
      "displayName": displayName,
      "phoneNumber": phoneNumber,
      "photoUrl": photoUrl,
      "email": email,
      "age": age,
      "gender": gender,
      "location": location,
      "createdAt": DateTime.parse(createdAt),
      "updatedAt": DateTime.parse(createdAt),
    };
  }


}