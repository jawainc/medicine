import 'package:flutter/material.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  final double padding;
  final double marginH;
  final double marginV;
  final Color backgroundColor;
  final Color shadowColor;
  final double borderRadius;
  final double shadowSpread;
  final double shadowBlur;
  final double shadowOffSetX;
  final double shadowOffSetY;
  ShadowContainer({
    @required this.child,
    this.padding: 10.0,
    this.marginH: 15.0,
    this.marginV: 20.0,
    this.backgroundColor: Colors.white,
    this.shadowColor: kBlue6,
    this.borderRadius: 5.0,
    this.shadowSpread: 5.0,
    this.shadowBlur: 10.0,
    this.shadowOffSetX: 0.0,
    this.shadowOffSetY: 4.0,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: Offset(shadowOffSetX, shadowOffSetY),
            spreadRadius: shadowSpread,
            blurRadius: shadowBlur,
          ),
        ],
      ),
      padding: EdgeInsets.all(padding),
      margin: new EdgeInsets.symmetric(
          horizontal: marginH, vertical: marginV),
      child: child,
    );
  }
}