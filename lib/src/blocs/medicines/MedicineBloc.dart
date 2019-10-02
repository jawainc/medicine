import 'package:rxdart/rxdart.dart';

import 'package:medicine_scheduler/src/resources/medicine/medicine_resource.dart';
import 'package:medicine_scheduler/src/models/Medicine.dart';

class MedicineBloc {
  final _medicines = PublishSubject<List<Medicine>>();

  // Getters for stream
  Observable<List<Medicine>> get medicines => _medicines.stream;

  fetchAllMedicines() async{
    final medicines = await medicine.fetchAllMedicines();
    _medicines.sink.add(medicines);
  }

  dispose() {
    _medicines.close();
  }
}