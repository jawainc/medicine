import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medicine_scheduler/src/models/Medicine.dart';
import 'package:medicine_scheduler/src/widgets/AppBarReusable.dart';
import 'package:medicine_scheduler/src/providers/SaveMedicineProvider.dart';
import 'package:medicine_scheduler/src/resources/medicine/medicine_resource.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/widgets/BottomAppBarReusable.dart';
import 'package:medicine_scheduler/src/widgets/BotAddButton.dart';
import 'package:medicine_scheduler/src/icons/medicine_icons_icons.dart';
import 'package:medicine_scheduler/src/widgets/ShadowContainer.dart';
import 'package:medicine_scheduler/src/widgets/CircularIconButton.dart';
import 'package:medicine_scheduler/src/widgets/ReusableSelectButton.dart';

class SaveMedicinePage extends StatelessWidget {
  final String visionText;

  const SaveMedicinePage({Key key, @required this.visionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Medicine medicineModel = Medicine.fromJson({
      'baseMedicineId': 'dummy_base_id',
      'name': visionText,
      'strength': '200mg',
      'type': 'Tablet',
      'dosage': 3,
      'quantity': 10,
      'packs': 5,
      'active': true,
      'deleted': false,
      'repeat': 'daily',
      'schedule': ['9:00', '14:00', '20:00']
    });

    final nameController = TextEditingController(text: medicineModel.name);
    final strengthController = TextEditingController(text: medicineModel.strength);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => SaveMedicineProvider(medicineModel),
        ),
      ],
      child: Scaffold(
        appBar: AppBarReusable(
            title: 'Add Medicine',
          actions: <Widget>[
            IconButton(icon: Icon(Icons.check, color: Colors.white,), onPressed: null)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: BotAddButton(),
        bottomNavigationBar: BottomAppBarReusable(kSaveMedicinePath, context),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              NameField(
                nameController: nameController,
              ),
              SizedBox(height: 20.0,),
              StrengthField(
                strengthController: strengthController,
              ),
              SizedBox(height: 20.0,),
              RepeatField(),
              SizedBox(height: 20.0,),
              DosageField(),
              SizedBox(height: 20,),
              MedicineType(),
              SizedBox(height: 20,),
              Schedules(),
              SizedBox(height: 20,),
              AddTimer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicineType extends StatelessWidget {
  const MedicineType({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SaveMedicineProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Medicine Type', style: kInputLabelTextStyle,),
          SizedBox(height: 10.0,),
          Container(
            height: 80.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: kMedicineTypes.length,
              itemBuilder: (context, index){
                return ReusableSelectButton(
                  onTap: () => provider.type = kMedicineTypes[index],
                  label: kMedicineTypes[index],
                  icon: kMedicineIcons[index],
                  active: provider.type == kMedicineTypes[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class DosageField extends StatelessWidget {
  const DosageField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SaveMedicineProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Dosage', style: kInputLabelTextStyle,),
        SizedBox(height: 5.0,),
        ShadowContainer(
          padding: 0.0,
          marginH: 0.0,
          marginV: 0.0,
          backgroundColor: kBlue6,
          shadowColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircularIconButton(
                onPressed: () => provider.dosage = 'decrease',
                icon: Icons.remove,
              ),
              Text(
                  provider.dosage,
                style: kBigTextStyle,
              ),
              CircularIconButton(
                onPressed: () => provider.dosage = 'increase',
                icon: Icons.add,
              ),
            ],
          ),

        ),
      ],
    );
  }
}
class SaveButton extends StatelessWidget {
  const SaveButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SaveMedicineProvider>(context);
    return FloatingActionButton(
      backgroundColor: Colors.green,
      child: Text('Save'),
      onPressed: () async {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            duration: Duration(minutes: 2),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Saving',
                  style: TextStyle(color: Colors.green),
                ),
                CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              ],
            ),
          ),
        );
        int id = await medicine.addMedicine(provider.medicine);
        if (id != null) {
          Navigator.pushNamed(context, kHomePath);
        }
      },
    );
  }
}
class AddTimer extends StatelessWidget {
  const AddTimer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SaveMedicineProvider>(context);
    return IconButton(
      icon: Icon(MedicineIcons.tablets),
      iconSize: 40.0,
      color: Colors.blue,
      onPressed: () {
        Future<TimeOfDay> selectedTime = showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
        );
        if (selectedTime != null) {
          selectedTime.then((onValue) {
            provider.addTime(onValue);
          });
        }
      },
    );
  }
}
class Schedules extends StatelessWidget {
  const Schedules({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SaveMedicineProvider>(context);
    var reminderWidgets = List<Widget>();
    for(var index = 0;  index <  provider.listTimes.length; index++) {
      reminderWidgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Future<TimeOfDay> selectedTime = showTimePicker(
                  initialTime: TimeOfDay(
                    hour: int.parse(provider.listTimes[index].split(':')[0]),
                    minute: int.parse(provider.listTimes[index].split(':')[1]),
                  ),
                  context: context,
                );

                if (selectedTime != null) {
                  selectedTime.then((onValue) {
                    provider.updateListTime({'index': index, 'timeValue': onValue});
                  });
                }
              },
              child: Text(getNormalTime(provider.listTimes[index])),
            ),
            IconButton(
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: kRed,
                ),
                onPressed: null,
            ),
          ],
        )
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Reminders', style: kInputLabelTextStyle,),
        AddTimer(),
        SizedBox(height: 5.0,),
        Container(
          child: Column(
            children: reminderWidgets,
          ),
        ),
      ],
    );
  }

  String getNormalTime(String time) {
    var times = time.split(":");
    var hour = int.parse(times[0]);

    if (hour >= 12) {
      return hour > 12 ? "${hour - 12}:${times[1]} PM" : "$time PM";
    } else {
      return "$time AM";
    }
  }
}
class NameField extends StatelessWidget {
  const NameField({
    Key key,
    @required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SaveMedicineProvider>(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Medicine Name",
            style: provider.valid == Valid.No ? kInputLabelErrorTextStyle : kInputLabelTextStyle,
          ),
          SizedBox(height: 5.0,),
          TextField(
            controller: nameController,
            onChanged: (text) => provider.name = text,
            style: kInputTextStyle,

            decoration: InputDecoration(
              fillColor: kInputBGColor,
              filled: true,
              contentPadding: kInputPadding,
              enabledBorder: kInputBorderStyle,
              focusedBorder: kInputFocusBorderStyle,
              focusedErrorBorder: kInputErrorBorderStyle,
              errorBorder: kInputErrorBorderStyle,
              errorText: provider.valid == Valid.No
                  ? "Name is required"
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
class StrengthField extends StatelessWidget {
  const StrengthField({
    Key key,
    @required this.strengthController,
  }) : super(key: key);

  final TextEditingController strengthController;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SaveMedicineProvider>(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Strength",
            style: kInputLabelTextStyle,
          ),
          SizedBox(height: 5.0,),
          TextField(
            controller: strengthController,
            onChanged: (text) => provider.strength = text,
            style: kInputTextStyle,
            decoration: InputDecoration(
              contentPadding: kInputPadding,
              enabledBorder: kInputBorderStyle,
              focusedBorder: kInputFocusBorderStyle,
            ),
          ),
        ],
      ),
    );
  }
}
class RepeatField extends StatelessWidget {
  const RepeatField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SaveMedicineProvider>(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "How often is this dose taken?",
            style: kInputLabelTextStyle,
          ),
          SizedBox(height: 5.0,),
          Container(
            padding: EdgeInsets.only(left: 15.0),
            decoration: BoxDecoration(
              borderRadius: kInputBorderRadius,
              border: Border.all(
                  color: kBlack1, style: BorderStyle.solid, width: 0.80),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                style: kInputTextStyle,
                elevation: 4,
                isExpanded: true,
                underline: null,
                value: provider.repeat,
                onChanged: (value) {
                  provider.repeat = value;
                },
                items: <String>['daily', 'weekly']
                .map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value[0].toUpperCase() + value.substring(1)),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
