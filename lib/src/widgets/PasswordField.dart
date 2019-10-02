import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medicine_scheduler/src/providers/RegisterProvider.dart';

class PasswordField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context);
    return TextField(
      onChanged: (text) => provider.password = text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Your password',
        labelText: 'Password',
        errorText: provider.passwordValid ? null: 'Password must be of min length 6',
      ),
    );
  }
}