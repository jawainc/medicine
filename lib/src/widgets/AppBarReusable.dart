import 'package:flutter/material.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';

class AppBarReusable extends AppBar {
  AppBarReusable({
    Key key,
    @required String title,
    List<Widget> actions,
  }) : super(
          key: key,
          title: Text(title, style: kAppBarHeadingText,),
          actions: actions,
          backgroundColor: kAppBarColor,
          elevation: kAppBarElevation,
          iconTheme: IconThemeData(
            color: kAppBarIconColor,
          ),
        );
  static ShapeBorder borderShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(kAppBarRadius),
  ));
}
