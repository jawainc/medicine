import 'package:flutter/material.dart';
import 'package:medicine_scheduler/src/blocs/medicines/MedicineBloc.dart';

class MedicineProvider extends InheritedWidget {
  final MedicineBloc bloc;

  MedicineProvider({Key key, Widget child})
    : bloc = MedicineBloc(),
      super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
        return true;
  }

  static MedicineBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MedicineProvider) as MedicineProvider).bloc;
  }

}