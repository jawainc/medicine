import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Medicine {

  int id;
  String uid;
  String mid;
  String baseMedicineId;
  String name;
  String strength;
  String type;
  List<dynamic> schedule;
  int packs;
  int quantity;
  int dosage;
  bool active;
  bool deleted;
  String repeat;
  String createdAt;
  String updatedAt;

  Medicine.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
      mid = parsedJson['mid'],
      baseMedicineId = parsedJson['baseMedicineId'],
      strength = parsedJson['strength'],
      type = parsedJson['type'],
      name = parsedJson['name'],
      schedule = parsedJson['schedule'],
      packs = parsedJson['packs'],
      quantity = parsedJson['quantity'],
      dosage = parsedJson['dosage'],
      active = parsedJson['active'] ?? true,
      deleted = parsedJson['deleted'] ?? false,
      repeat = parsedJson['repeat'],
      createdAt = parsedJson['createdAt'] ?? DateTime.now().toString(),
      updatedAt = parsedJson['updatedAt'] ?? DateTime.now().toString();

  Medicine.fromDb(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        mid = parsedJson['mid'],
        baseMedicineId = parsedJson['baseMedicineId'],
        strength = parsedJson['strength'],
        type = parsedJson['type'],
        name = parsedJson['name'],
        schedule = jsonDecode(parsedJson['schedule']),
        packs = parsedJson['packs'],
        quantity = parsedJson['quantity'],
        dosage = parsedJson['dosage'],
        active = parsedJson['active'] == 1,
        deleted = parsedJson['deleted'] == 1,
        repeat = parsedJson['repeat'],
        createdAt = parsedJson['createdAt'],
        updatedAt = parsedJson['updatedAt'];

  Medicine.fromFireBase(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        uid = parsedJson['uid'],
        mid = parsedJson['mid'],
        baseMedicineId = parsedJson['baseMedicineId'],
        strength = parsedJson['strength'],
        type = parsedJson['type'],
        name = parsedJson['name'],
        schedule = parsedJson['schedule'],
        packs = parsedJson['packs'],
        quantity = parsedJson['quantity'],
        dosage = parsedJson['dosage'],
        active = parsedJson['active'] == 1,
        deleted = parsedJson['deleted'] == 1,
        repeat = parsedJson['repeat'],
        createdAt = parsedJson['createdAt'].toDate().toString(),
        updatedAt = parsedJson['createdAt'].toDate().toString();

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      "mid": mid,
      "baseMedicineId": baseMedicineId,
      "strength": strength,
      "type": type,
      "name": name,
      "schedule": jsonEncode(schedule),
      "packs": packs,
      "quantity": quantity,
      "dosage": dosage,
      "active": active ? 1 : 0,
      "deleted": deleted ? 1 : 0,
      "repeat": repeat,
      "createdAt": createdAt,
      "updatedAt": updatedAt
    };
  }

  Map<String, dynamic> toFireBaseMap() {
    return <String, dynamic> {
      "uid": uid,
      "baseMedicineId": baseMedicineId,
      "strength": strength,
      "type": type,
      "name": name,
      "schedule": schedule,
      "packs": packs,
      "quantity": quantity,
      "dosage": dosage,
      "active": active,
      "deleted": deleted,
      "repeat": repeat,
      "createdAt": DateTime.parse(createdAt),
      "updatedAt": DateTime.parse(createdAt),
    };
  }

  factory Medicine.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data;
    data.putIfAbsent('mid', () => doc.documentID);

    return Medicine.fromFireBase(data);
  }
}