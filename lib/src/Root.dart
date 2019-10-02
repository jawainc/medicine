import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:medicine_scheduler/src/resources/user/user_resource.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/widgets/Logo.dart';
import 'package:medicine_scheduler/src/arguments/SaveMedicineArguments.dart';

class Root extends StatefulWidget {
  @override
  RootState createState() => RootState();
}

class RootState extends State<Root> with AfterLayoutMixin<Root> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 200.0,
          child: logoIcon(),
        )
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
     Navigator.pushReplacementNamed(
       context,
       kSaveMedicinePath,
       arguments: SaveMedicineArguments('Dummy Medicine'),
     );
//    bool userExist = await user.isUserExist();
//    if(userExist) {
//      Navigator.pushReplacementNamed(context, kHomePath);
//    } else {
//      Navigator.pushReplacementNamed(context, kLoginPath);
//    }
  }
}
