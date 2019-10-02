import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:medicine_scheduler/src/widgets/ReusableIconLogo.dart';
import 'package:provider/provider.dart';
import 'package:medicine_scheduler/src/providers/RegisterProvider.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/widgets/EmailField.dart';
import 'package:medicine_scheduler/src/widgets/PasswordField.dart';
import 'package:medicine_scheduler/src/resources/Authenticate.dart';
import 'package:medicine_scheduler/src/resources/user/user_resource.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => RegisterProvider(),)
      ],
      child: Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ReusableIconLogo(label: 'Login',),
            Container(
              margin: EdgeInsets.only(
                top: 25.0,
              ),
            ),
            EmailField(),
            PasswordField(),
            Container(
              margin: EdgeInsets.only(
                top: 25.0,
              ),
            ),
            Consumer<RegisterProvider>(
                  builder: (context, registerProvider, _) {
                    return registerProvider.busy
                        ? CircularProgressIndicator()
                        : RaisedButton(
                      child: Text('Login'),
                      onPressed: registerProvider.buttonActive ? () async{
                        final validEmail = registerProvider.email;
                        final validPassword = registerProvider.password;

                        registerProvider.busy = true;
                        try{
                          Map<String, dynamic> apiUser = await auth.loginWithEmailPassword(validEmail, validPassword);

                          if(apiUser['status']) {
                            user.addFireBaseCredential(apiUser['user']);
                          } else {
                            Alert(
                              context: context,
                              title: 'Error',
                              type: AlertType.warning,
                              desc: apiUser['message'],
                            ).show();
                          }
                        } catch(e) {

                        } finally {
                          registerProvider.busy = false;
                        }

                      } : null,
                    );
                  },
              ),
            RaisedButton(
              child: Text('Register'),
              onPressed: () {
                Navigator.pushNamed(context, kRegisterPath);
              },
            ),
          ],
        ),
      ),
    ),
    );
    
  }
}
