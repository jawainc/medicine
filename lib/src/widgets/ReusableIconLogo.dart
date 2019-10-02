import 'package:flutter/material.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ReusableIconLogo extends StatelessWidget {

  ReusableIconLogo({@required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          FontAwesome.heartbeat,
          color: kLogoIconColor,
          size: kLogoIconSize,
        ),
        SizedBox(
          width: 15.0,
        ),
        Text(
          label,
          style: kLogoLabelTextStyle,
        ),
      ],
    );
  }
}
