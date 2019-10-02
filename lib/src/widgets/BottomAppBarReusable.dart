import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';

class BottomAppBarReusable extends BottomAppBar {

  final String activePage;

  BottomAppBarReusable(
      this.activePage,
    BuildContext context,
  ) :super(
    shape: CircularNotchedRectangle(),
    notchMargin: kNotchDistance,
    color: kBotBarBGColor,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        // Home Button
        IconButton(
          icon: Icon(
            Icons.home,
            color: activePage == kHomePath ? kBotBarActiveIconColor : kBotBarDeActiveIconColor,
          ),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(
            FontAwesome5Solid.prescription_bottle,
            color: activePage == kHomePath ? kBotBarActiveIconColor : kBotBarDeActiveIconColor,
          ),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(
            Icons.calendar_today,
            color: activePage == kHomePath ? kBotBarActiveIconColor : kBotBarDeActiveIconColor,
          ),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: activePage == kHomePath ? kBotBarActiveIconColor : kBotBarDeActiveIconColor,
          ),
          onPressed: (){},
        ),
      ],
    )
  );



}