import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:medicine_scheduler/src/models/Medicine.dart';
import 'package:medicine_scheduler/src/blocs/medicines/MedicineProvider.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/widgets/AppBarReusable.dart';
import 'package:medicine_scheduler/src/widgets/BottomAppBarReusable.dart';
import 'package:medicine_scheduler/src/widgets/BotAddButton.dart';
import 'package:medicine_scheduler/src/resources/Helpers.dart';
import 'package:medicine_scheduler/src/widgets/ShadowContainer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MedicineProvider(
      child: Scaffold(
        appBar: AppBarReusable(
          title: 'Home',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: BotAddButton(),
        bottomNavigationBar: BottomAppBarReusable(kHomePath, context),
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = MedicineProvider.of(context);
    provider.fetchAllMedicines();
    return Scaffold(
          body: Container(
        
        child: StreamBuilder(
            stream: provider.medicines,
            builder: (context, AsyncSnapshot<List<Medicine>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!snapshot.hasData) {
                return Center(
                  child: Text('No Medicines Found. Add an new one.', style: kAppBarSubHeadingText,),
                );
              }

              return ListView.builder(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    Medicine medicineItem = snapshot.data[index];
                    return ShadowContainer(
                      child: ListItem(),
                    );
                  });
            }),
      ),
    );
  }

  List<Widget> timerList(List<String> timeList) {
    List<Widget> widgets = [];
    for (String item in timeList) {
      widgets.add(SizedBox(
        width: 10.0,
      ));
      widgets.add(Text(
        getNormalTime(item),
        style: kReminderTimeTextStyle,
      ));
    }

    return widgets;
  }

  String getNormalTime(String time) {
    var times = time.split(":");
    var hour = int.parse(times[0]);

    if (hour >= 12) {
      return hour > 12 ? "${hour - 12}:${times[1]}PM" : "${time}PM";
    } else {
      return "${time}AM";
    }
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          FontAwesome5Solid.eye_dropper,
          color: kIconColor,
          size: 35,
        ),
        SizedBox(width: 30.0,),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('9:00 AM', style: kReminderTimeTextStyle,),
                  SizedBox(width: 10.0,),
                  Container(
                    decoration: kLabel,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 2.0,
                    ),
                    child: Text('2 Tablets', style: kListNoOfPillsHeadingTextStyle,),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Ibrufen', style: kMedicineListTitleTextStyle,),
              Text('200mg', style: kMedicineListStrengthTextStyle,),
              SizedBox(height: 5.0,),
              Text('half hour before meal', style: kMedicineListDescriptionTextStyle,),

            ],
          ),
        ),
        Column(
          children: <Widget>[
            Icon(Icons.alarm_on, color: kBlack1,),
            SizedBox(height: 50.0,),
            Icon(Icons.settings, color: kBlue1,),
          ],
        ),
      ],
    );
  }
}

/*class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kShadow,
      padding: EdgeInsets.all(10.0),
      margin: new EdgeInsets.symmetric(
          horizontal: 15.0, vertical: 20.0),
      child: Row(
        children: <Widget>[
          Icon(
            FontAwesome5Solid.eye_dropper,
            color: kIconColor,
            size: 35,
          ),
          SizedBox(width: 30.0,),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('9:00 AM', style: kReminderTimeTextStyle,),
                    SizedBox(width: 10.0,),
                    Container(
                      decoration: kLabel,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 2.0,
                      ),
                      child: Text('2 Tablets', style: kListNoOfPillsHeadingTextStyle,),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Ibrufen', style: kMedicineListTitleTextStyle,),
                Text('200mg', style: kMedicineListStrengthTextStyle,),
                SizedBox(height: 5.0,),
                Text('half hour before meal', style: kMedicineListDescriptionTextStyle,),

              ],
            ),
          ),
          Column(
            children: <Widget>[
              Icon(Icons.alarm_on, color: kBlack1,),
              SizedBox(height: 50.0,),
              Icon(Icons.settings, color: kBlue1,),
            ],
          ),
        ],
      ),
    );
  }
}*/


/*
Container(
child: Column(
children: <Widget>[
SizedBox(
height: 10,
),
Row(
children:
timerList(medicineItem.schedule.cast<String>()),
),
Divider(),
ListTile(
contentPadding: EdgeInsets.symmetric(
horizontal: 10.0, vertical: 10.0),
title: Row(
children: <Widget>[
Text(
medicineItem.name,
style: kMedicineListTitleTextStyle,
),
SizedBox(
width: 15,
),
Text(
medicineItem.strength,
style: kMedicineListStrengthTextStyle,
),
],
),
subtitle: Row(
children: <Widget>[
Text(
medicineItem.type,
style: kMedicineListStrengthTextStyle,
),
SizedBox(
width: 15,
),
Text(
"Qty: ${medicineItem.quantity}",
style: kMedicineListStrengthTextStyle,
)
],
),
trailing: Icon(Icons.keyboard_arrow_right,
color: Colors.white, size: 30.0)),
],
),
)*/
