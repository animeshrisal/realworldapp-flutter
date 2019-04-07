import 'package:realworldapp/bloc_widgets/bloc_state_builder.dart';
import 'package:realworldapp/blocs/registration/register_bloc.dart';
import 'package:realworldapp/blocs/registration/register_event.dart';
import 'package:realworldapp/blocs/registration/register_form_bloc.dart';
import 'package:realworldapp/blocs/registration/register_state.dart';
import 'package:realworldapp/widgets/pending_action.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _usernameController;
  RegisterFormBloc _registerFormBloc;
  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _registerFormBloc = RegisterFormBloc();
    _registerBloc = RegisterBloc();
  }

  @override
  void dispose() {
    _registerBloc?.dispose();
    _registerFormBloc?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
    _usernameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocEventStateBuilder<RegisterState>(
        bloc: _registerBloc,
        builder: (BuildContext context, RegisterState state) {
          if (state.isBusy) {
            return PendingAction();
          } else if (state.isSuccess) {
            return _buildSuccess();
          } else if (state.isFailure) {
            return _buildFailure();
          }
          return _buildForm();
        });
  }

  Widget _buildSuccess() {
    return Center(
      child: Text('Success'),
    );
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
              stream: _registerFormBloc.email,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'email',
                    errorText: snapshot.error,
                  ),
                  controller: _emailController,
                  onChanged: _registerFormBloc.changeEmail,
                  keyboardType: TextInputType.emailAddress,
                );
              }),
          StreamBuilder<String>(
              stream: _registerFormBloc.password,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'password',
                    errorText: snapshot.error,
                  ),
                  controller: _passwordController,
                  obscureText: false,
                  onChanged: _registerFormBloc.changePassword,
                );
              }),
          StreamBuilder<String>(
              stream: _registerFormBloc.username,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    errorText: snapshot.error,
                  ),
                  controller: _usernameController,
                  obscureText: false,
                  onChanged: _registerFormBloc.changeUsername,
                );
              }),
          StreamBuilder<bool>(
              stream: _registerFormBloc.submitValid,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return RaisedButton(
                  child: Text('Register'),
                  onPressed: (snapshot.hasData && snapshot.data == true)
                      ? () {
                          print("AAAA");
                          _registerBloc.emitEvent(RegisterEvent(
                              event: RegisterEventType.working,
                              email: _emailController.text,
                              password: _passwordController.text,
                              username: _usernameController.text));
                        }
                      : null,
                );
              }),
        ],
      ),
    );
  }
}
