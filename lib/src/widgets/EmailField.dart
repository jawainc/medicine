import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medicine_scheduler/src/providers/RegisterProvider.dart';

class EmailField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context);
    return TextField(
      onChanged: (text) => provider.email = text,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'you@example.com',
        labelText: 'Email Address',
        errorText: provider.emailValid ? null : 'Enter a valid email' ,
      ),
    );
  }

}