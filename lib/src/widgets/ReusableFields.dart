import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/providers/SaveMedicineProvider.dart';


class ReusableField extends StatelessWidget {
  const ReusableField({
    Key key,
    @required this.fieldController,
    @required this.label,
    this.errorLabel
  }) : super(key: key);

  final TextEditingController fieldController;
  final String label;
  final String errorLabel;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SaveMedicineProvider>(context);

    return Container(
      child: Column(
        children: <Widget>[
          Text(
            label,
            style: kInputLabelTextStyle,
          ),
          TextField(
            controller: fieldController,
            onChanged: (text) => provider.name = text,
            style: kInputTextStyle,
            decoration: InputDecoration(
              contentPadding: kInputPadding,
              enabledBorder: kInputBorderStyle,
              focusedBorder: kInputFocusBorderStyle,
              errorText: (errorLabel.isNotEmpty && provider.valid == Valid.No)
                  ? errorLabel
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}