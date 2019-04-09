import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:realworldapp/blocs/validators.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';

class LoginFormBloc extends Object with Validators implements BlocBase {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
