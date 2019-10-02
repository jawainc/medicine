import 'dart:async';

import 'package:medicine_scheduler/src/resources/medicine/medicine_api_provider.dart';
import 'package:medicine_scheduler/src/resources/medicine/medicine_db_provider.dart';
import 'package:medicine_scheduler/src/models/Medicine.dart';

class MedicineResource{
  MedicineDbProvider _db = MedicineDbProvider();
  MedicineApiProvider _api = MedicineApiProvider();

  Future<Medicine> fetchMedicine(int id) async{
    Medicine medicine = await _db.fetchMedicine(id);
    return medicine;
  }

  Future<List<Medicine>> fetchAllMedicines() async{
    List<Medicine> list = await _db.fetchAllMedicines();
    if(list != null) {
      return list;
    } else {
      List<Medicine> apiList = await _api.fetchAllMedicines();
      if(apiList != null) {
        await _db.addBatch(apiList);
      }
      return apiList;
    }
  }

  Future<int> addMedicine(Medicine medicine) async{
    String mid = await _api.addMedicine(medicine);
    medicine.mid = mid;
    int id = await _db.addMedicine(medicine);
    return id;
  }
}

final medicine = MedicineResource();