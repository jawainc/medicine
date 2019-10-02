import 'dart:async';

import 'package:medicine_scheduler/src/models/Medicine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/resources/Authenticate.dart';

class MedicineApiProvider {

  final CollectionReference collection = Firestore.instance.collection(kMedicinesTable);

  Future<Medicine> fetchMedicine(String mid) async{
    DocumentSnapshot doc = await collection.document(mid).get();
    if(doc.exists) {
      return Medicine.fromFireStore(doc);
    }
    
    return null;
  }
  
  Future<List<Medicine>> fetchAllMedicines() async{
    String uid = await auth.getUid();
    if(uid != null) {
      QuerySnapshot docs = await collection.where('uid', isEqualTo: uid).getDocuments();
      if(docs.documents.length > 0) {
        return docs.documents.map((doc) => Medicine.fromFireStore(doc)).toList();
      }
    }
    
    return null;
  }

  Future<String> addMedicine(Medicine medicine) async{
    String uid = await auth.getUid();
    if(uid != null) {
      medicine.uid = uid;
    }
    DocumentReference doc = await collection.add(medicine.toFireBaseMap());
    return doc.documentID;
  }

}
