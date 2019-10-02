import 'package:flutter/foundation.dart';

class RegisterProvider with ChangeNotifier{

  String _email = '';
  String _password = '';
  bool _isEmail = true;
  bool _isPassword = true;
  bool _buttonActive = false;
  bool _busy = false;

  bool get busy => _busy;
  String get email => _email;
  String get password => _password;
  bool get emailValid => _isEmail;
  bool get passwordValid => _isPassword;
  bool get buttonActive => _buttonActive;

  set busy(bool setBusy) {
    _busy = setBusy;
    notifyListeners();
  }

  set email(String emailText) {
    _email = emailText;
    _isEmail = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailText);
    _buttonActive = _email.length > 0 && _password.length > 0 && _isEmail && _isPassword;

    notifyListeners();
  }

  set password(String passwordText) {
    _password = passwordText;
    _isPassword = passwordText.length > 5;
    _buttonActive = _email.length > 0 && _password.length > 0 && _isEmail && _isPassword;
    notifyListeners();
  }

}