import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:medicine_scheduler/src/models/Medicine.dart';

enum Valid{
  Yes,
  No
}

class SaveMedicineProvider with ChangeNotifier {
  
  Valid _nameValid;
  List<String> _listTimes;
  Medicine _medicine;

  SaveMedicineProvider(
    this._medicine,
    );

  String get name => _medicine.name;
  String get strength => _medicine.strength;
  String get repeat => _medicine.repeat;
  String get type => _medicine.type;
  String get dosage => _medicine.dosage.toString();
  List<String> get listTimes => _medicine.schedule;
  Valid get valid => _nameValid;
  Medicine get medicine => _medicine;

  set name(String name) {
    _medicine.name = name;
    _nameValid = name.isEmpty ? Valid.No : Valid.Yes;
    notifyListeners();
  }

  set strength(String strength) {
    _medicine.strength = strength;
    notifyListeners();
  }

  set repeat(String repeat) {
    _medicine.repeat = repeat;
    notifyListeners();
  }

  set type(String type) {
    _medicine.type = type;
    notifyListeners();
  }

  set dosage(String action) {
    if(action == 'increase')
      _medicine.dosage ++;
    else if(_medicine.dosage > 1) {
      _medicine.dosage --;
    }

    notifyListeners();
  }

  
  updateListTime(Map<String, dynamic> time) {
    String minute = time['timeValue'].minute.toString();
    String min = minute.length > 1 ? minute : "0$minute";
    String timeToSet = "${time['timeValue'].hour}:$min";
    int index = time['index'];
    _medicine.schedule.replaceRange(index, index+1, <String>[timeToSet]);
    notifyListeners();
  }

  addTime(TimeOfDay time) {
    String minute = time.minute.toString();
    String min = minute.length > 1 ? minute : "0$minute";
    String timeToSet = "${time.hour}:$min";
    _medicine.schedule.add(timeToSet);
    notifyListeners();
  }

  removeTime(int index) {
    _medicine.schedule.removeAt(index);
    notifyListeners();
  }


}