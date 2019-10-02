import 'package:flutter/material.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/widgets/ShadowContainer.dart';
import 'package:medicine_scheduler/src/icons/medicine_icons_icons.dart';

class ReusableSelectButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final String label;
  final bool active;
  const ReusableSelectButton({
    Key key,
    @required this.onTap,
    @required this.icon,
    @required this.label,
    this.active: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: kBlue1, width: 1.0),
            borderRadius: BorderRadius.circular(5.0)),
        elevation: 1.0,
        color: active ? kBlue2 : kWhite,
        child: Container(
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 20.0,
                color: active ? kWhite : kBlue1,
              ),
              SizedBox(height: 10.0,),
              Text(
                label,
                style: TextStyle(
                  color: active ? kWhite : kBlue1,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}