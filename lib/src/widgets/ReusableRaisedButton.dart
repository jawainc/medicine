import 'package:flutter/material.dart';

class ReUseAbleRaisedButton extends StatelessWidget {
  final Function onPressed;
  final Widget label;

  ReUseAbleRaisedButton({@required this.onPressed, @required this.label});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: label,
    );
  }

}