import 'dart:async';

import 'package:medicine_scheduler/src/models/Medicine.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/resources/DBTables.dart';

class MedicineDbProvider {
  String _table = kMedicinesTable;

  Future<List<Medicine>> fetchAllMedicines() async {
    var db = await database.open();
    final results = await db.query(
      _table,
      columns: null
    );

    if(results.length > 0) {
      List<Medicine> medicines = [];
      for(var medicine_item in results) {
        medicines.add(Medicine.fromDb(medicine_item));
      }

      return medicines;
    }

    return null;
  }
  
  Future<Medicine> fetchMedicine(int id) async{
    var db = await database.open();
    final results = await db.query(
      _table,
      columns: null,
      where: "id = ?",
      whereArgs: [id]
    );

    if(results.length > 0) {
      return Medicine.fromDb(results.first);
    }

    return null;
  }

  Future<int> addMedicine(Medicine medicine) async{
    var db = await database.open();
    return db.insert(_table, medicine.toMap());
  }

  Future<void> addBatch(List<Medicine> medicineList) async{
    var db = await database.open();
    for(var medicine_item in medicineList) {
      db.insert(_table, medicine_item.toMap());
    }
  }
}