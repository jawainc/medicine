import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';

class DataBase {
  final String _userTable = """
          CREATE TABLE $kUserTable
          (
            id INTEGER PRIMARY KEY,
            uid TEXT,
            firstName TEXT,
            lastName TEXT,
            displayName TEXT,
            phoneNumber TEXT,
            photoUrl TEXT,
            email TEXT,
            age TEXT,
            gender TEXT,
            location TEXT,
            createdAt TEXT,
            updatedAt TEXT
          )
      """;

  final _medicineTable = """
          CREATE TABLE $kMedicinesTable
          (
            id INTEGER PRIMARY KEY,
            mid TEXT,
            baseMedicineId TEXT,
            name TEXT,
            strength TEXT,
            type TEXT,
            repeat TEXT,
            schedule BLOB,
            packs INTEGER,
            quantity INTEGER,
            dosage INTEGER,
            active INTEGER,
            deleted INTEGER,
            createdAt TEXT,
            updatedAt TEXT
          )
      """;

  Future<dynamic> open() async {
    String databasePath = await getDatabasesPath();
    final path = join(databasePath, 'medicines.db');
    var db = await openDatabase(
        path,
        version: kDatabaseVersion,
        onCreate: (Database newDb, int version) async{
          await newDb.execute(_userTable);
          await newDb.execute(_medicineTable);
        }
    );

    return db;
  }
}

final database = DataBase();