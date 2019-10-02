import 'package:flutter/material.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/resources/Router.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kAppBackgroundColor,
      ),
      initialRoute: kRootPath,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
