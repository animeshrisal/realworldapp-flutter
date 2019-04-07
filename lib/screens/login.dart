import 'package:realworldapp/bloc_widgets/bloc_state_builder.dart';
import 'package:realworldapp/blocs/login/login_bloc.dart';
import 'package:realworldapp/blocs/login/login_event.dart';
import 'package:realworldapp/blocs/login/login_form_bloc.dart';
import 'package:realworldapp/blocs/login/login_state.dart';
import 'package:realworldapp/widgets/pending_action.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  LoginFormBloc _loginFormBloc;
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _loginFormBloc = LoginFormBloc();
    _loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    _loginBloc?.dispose();
    _loginFormBloc?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocEventStateBuilder<LoginState>(
        bloc: _loginBloc,
        builder: (BuildContext context, LoginState state) {
          if (state.isBusy) {
            return PendingAction();
          } else if (state.isSuccess) {
            //
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed('/home');
            });
          } else if (state.isFailure) {
            return _buildFailure();
          }
          return _buildForm();
        });
  }

  Widget _buildFailure() {
    return Center(
      child: Text('Failure'),
    );
  }

  Widget _buildForm() {
    return Form(
      child: Column(
        children: <Widget>[
          StreamBuilder<String>(
              stream: _loginFormBloc.email,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'email',
                    errorText: snapshot.error,
                  ),
                  controller: _emailController,
                  onChanged: _loginFormBloc.changeEmail,
                  keyboardType: TextInputType.emailAddress,
                );
              }),
          StreamBuilder<String>(
              stream: _loginFormBloc.password,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'password',
                    errorText: snapshot.error,
                  ),
                  controller: _passwordController,
                  obscureText: false,
                  onChanged: _loginFormBloc.changePassword,
                );
              }),
          StreamBuilder<bool>(
              stream: _loginFormBloc.submitValid,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return RaisedButton(
                  child: Text('Login'),
                  onPressed: (snapshot.hasData && snapshot.data == true)
                      ? () {
                          print("AAAA");
                          _loginBloc.emitEvent(LoginEvent(
                              event: LoginEventType.working,
                              email: _emailController.text,
                              password: _passwordController.text));
                        }
                      : null,
                );
              }),
        ],
      ),
    );
  }
}
