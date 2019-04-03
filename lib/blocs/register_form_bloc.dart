import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:realworldapp/blocs/validators.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';

class RegisterFormBloc extends Object with Validators implements BlocBase {
  final _emailController = BehaviorSubject<String>();
  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<String> get username =>
      _usernameController.transform(validateUsername);

  Stream<bool> get submitValid =>
      Observable.combineLatest3(email, password, username, (e, p, u) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeUsername => _usernameController.sink.add;

  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    final validUsername = _usernameController.value;

    print(
        'Email is $validEmail, and password is $validPassword, and the username is $validUsername');
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
    _usernameController.close();
  }
}
