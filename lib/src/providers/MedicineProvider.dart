import 'package:flutter/foundation.dart';
import 'package:medicine_scheduler/src/resources/medicine/medicine_resource.dart';
import 'package:medicine_scheduler/src/models/Medicine.dart';
import 'dart:async';

enum ViewState {
  Busy,
  Idle
}
enum DataLoaded{
  Yes,
  No
}
class MedicineProvider with ChangeNotifier {
  ViewState _busy = ViewState.Busy;
  DataLoaded _dataLoaded = DataLoaded.No;
  List<Medicine> _medicineList;

  bool get busy => _busy == ViewState.Busy;
  bool get hasData => _busy == ViewState.Idle && _dataLoaded == DataLoaded.Yes;
  List<Medicine> get medicineList => _medicineList;

  void setState(ViewState state) {
    _busy = state;
    notifyListeners();
  }

  void getAllMedicines() async{
   _fetchAllMedicines();

  }

  Future<void> _fetchAllMedicines() async{
    try{
      List<Medicine> list = await medicine.fetchAllMedicines();
      print(list);
      if(list != null) {
        _dataLoaded = DataLoaded.Yes;
        _medicineList = list;
      } else {
        _dataLoaded = DataLoaded.No;
      }
    } catch(e) {
      print(e);
      _dataLoaded = DataLoaded.No;
    } finally {
      setState(ViewState.Idle);
      notifyListeners();
    }


  }

}