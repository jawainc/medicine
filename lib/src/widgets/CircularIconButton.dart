import 'package:flutter/material.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  const CircularIconButton({
    Key key,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      highlightColor: kBlue,
      child: new Icon(
        icon,
        color: kWhite,
        size: 18.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: kBlue4,
      padding: const EdgeInsets.all(1.0),
    );
  }
}