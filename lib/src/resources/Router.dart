import 'package:flutter/material.dart';

import 'package:medicine_scheduler/src/Root.dart';
import 'package:medicine_scheduler/src/screens/HomePage.dart';
import 'package:medicine_scheduler/src/screens/LoginPage.dart';
import 'package:medicine_scheduler/src/screens/RegisterPage.dart';
import 'package:medicine_scheduler/src/screens/ScanPage.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/arguments/SaveMedicineArguments.dart';
import 'package:medicine_scheduler/src/screens/SaveMedicinePage.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kRootPath:
        return MaterialPageRoute(builder: (_) => Root());
      case kHomePath:
        return MaterialPageRoute(builder: (_) => HomePage());
      case kLoginPath:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case kRegisterPath:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case kScanPagePath:
        return MaterialPageRoute(builder: (_) => ScanPage());
      case kSaveMedicinePath:
        final SaveMedicineArguments args = settings.arguments;
        return MaterialPageRoute(builder: (context) => SaveMedicinePage(
          visionText: args.visiontext,
        ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
