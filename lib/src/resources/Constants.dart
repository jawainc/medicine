import 'package:flutter/material.dart';
import 'package:medicine_scheduler/src/icons/medicine_icons_icons.dart';
// routes
const kRootPath = 'root';
const kHomePath = '/';
const kLoginPath = 'login';
const kRegisterPath = 'register';
const kScanPagePath = 'scan';
const kSaveMedicinePath = 'save_medicine';

// Database and FireStore
const kDatabaseVersion = 8;
const kUserTable = 'users';
const kMedicinesTable = 'medicines';
const kGroupChatTable = 'group_chats';
const kBaseMedicineTable = 'base_medicines';

// Static Data
const kMedicineTypes = ["Capsule", "Tablet", "Injection", "Syrup", "Cream", "Drops", "Other"];
const kMedicineIcons = [
  MedicineIcons.capsule,
  MedicineIcons.tablets,
  MedicineIcons.syringe,
  MedicineIcons.syrup,
  MedicineIcons.antiseptic_cream,
  MedicineIcons.dropper,
  MedicineIcons.pill_bottle
];

// Colors
//const kGreen = Color(0xFF0EBF61);
const kRed = Color(0xFFff7f00);
const kRed1 = Color(0xFFff8c25);
const kRed2 = Color(0xFFff9f48);
const kRed3 = Color(0xFFffb26c);
const kRed4 = Color(0xFFffc490);
const kRed5 = Color(0xFFffd7b3);
const kRed6 = Color(0xFFffebda);

const kBlue = Color(0xFF0080ff);
const kBlue1 = Color(0xFF289eff);
const kBlue2 = Color(0xFF4aadff);
const kBlue3 = Color(0xFF6fbeff);
const kBlue4 = Color(0xFF92ceff);
const kBlue5 = Color(0xFFb6dfff);
const kBlue6 = Color(0xFFdceefe);

const kBlack = Color(0xFF242424);
const kBlack1 = Color(0xFF5c6573);
const kBlack2 = Color(0xFFc6c6c6);

const kWhite = Colors.white;
const kWhite1 = Color(0xFFFEFEEF);
const kWhite2 = Color(0xFFf6f6f6);

const kAppBackgroundColor = kWhite;
const kShadowColor = kBlack2;
const kInputBGColor = kWhite2;
const kInputBorderColor = kBlack2;

// Text
const kTextColor = kBlack;
const kSubTextColor = kBlack1;
const kBigTextStyle = TextStyle(
    color: kBlack,
    fontSize: 50,
);
// Icon


// logo
const kLogoIcon = 'heartbeat';
const kLogoIconColor = Colors.green;
const kLogoIconSize = 50.0;
const kLogoLabelTextStyle = TextStyle(
  color: Color(0xFF8D8E98),
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
);

///// Theme ////
const kShadow = BoxDecoration(
  color: kWhite,
  borderRadius: BorderRadius.all(Radius.circular(5.0)),
  boxShadow: [
    BoxShadow(
      color: kShadowColor,
      offset: Offset(0.0, 4.0),
      spreadRadius: 5.0,
      blurRadius: 10.0,
    ),
  ],
);
const kLabel = BoxDecoration(
  color: kBlue,
  borderRadius: BorderRadius.all(Radius.circular(50.0)),
);
const kIconColor = kBlack;
const kIconInActiveColor = kBlack1;


// AppBar
const kAppBarColor = kBlue;
const kAppBarRadius = 0.0;
const kAppBarElevation = 5.0;
const kAppBarHeadingText = TextStyle(
  color: kWhite,
  fontSize: 18.0,
);
const kAppBarIconColor = kWhite;
const kAppBarSubHeadingText = TextStyle(
  color: kWhite1,
  fontSize: 14.0,
);
// BotBar
const kFloatButtonColor = kBlue;
const kNotchDistance = 2.0;
const kBotBarActiveIconColor = kBlue1;
const kBotBarDeActiveIconColor = kBlack2;
const kBotBarBGColor = kWhite2;

// Text Styles
const kListNoOfPillsHeadingTextStyle = TextStyle(
  color: kWhite,
  fontSize: 14.0,
);
const kReminderTimeTextStyle = TextStyle(
  color: kBlack1,
  fontSize: 14,
  fontWeight: FontWeight.bold,
);
const kMedicineListTitleTextStyle =
    TextStyle(color: kBlack, fontSize: 30, fontWeight: FontWeight.w900);
const kMedicineListStrengthTextStyle = TextStyle(
  color: kBlack1,
  fontSize: 13,
);
const kMedicineListDescriptionTextStyle = TextStyle(
  color: kBlack1,
  fontSize: 15,
);

// Input
const kInputBorderRadius = BorderRadius.all(Radius.circular(2.0));
const kInputPadding = EdgeInsets.all(15.0);
const kInputTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15.0,
  color: kBlack,
);
const kInputLabelTextStyle = TextStyle(
  color: kBlack,
);
const kInputLabelErrorTextStyle = TextStyle(
  color: kRed,
  fontWeight: FontWeight.bold,
);
const kInputBorderStyle = OutlineInputBorder(
  borderRadius: kInputBorderRadius,
  borderSide: BorderSide(
    width: 1.0,
    color: kInputBorderColor,
  ),
);
const kInputFocusBorderStyle = OutlineInputBorder(
  borderRadius: kInputBorderRadius,
  borderSide: BorderSide(
    color: kBlue1,
  ),
);
const kInputErrorBorderStyle = OutlineInputBorder(
  borderRadius: kInputBorderRadius,
  borderSide: BorderSide(
    color: kRed,
  ),
);


const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
