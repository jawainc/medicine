import 'package:flutter/material.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';

class BotAddButton extends StatelessWidget {
  const BotAddButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, kScanPagePath),
      backgroundColor: kFloatButtonColor,
      mini: true,
      child: Icon(Icons.add),
    );
  }
}