import 'dart:async';
import './validators.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/Authenticate.dart';
import '../resources/user/user_resource.dart';


class Bloc with Validator {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Add data to streams
  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e,p) => true);

  // Change Data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  login() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email: $validEmail');
    print('Password: $validPassword');
  }

  Future<Map<String, dynamic>> register(context) async{
    final validEmail = _email.value;
    final validPassword = _password.value;

    Map<String, dynamic> apiUser = await auth.registerWithEmailPassword(validEmail, validPassword);

    if(apiUser['status']) {
      user.addFireBaseCredential(apiUser['user']);
    }

    return apiUser;
  }

  dispose() {
    _email.close();
    _password.close();
  }

}

final bloc = new Bloc();