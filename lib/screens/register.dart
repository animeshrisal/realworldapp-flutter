import 'package:realworldapp/bloc_widgets/bloc_state_builder.dart';
import 'package:realworldapp/blocs/authentication/register_form_bloc.dart';
import 'package:realworldapp/widgets/pending_action.dart';
import 'package:realworldapp/blocs/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';
import 'package:realworldapp/blocs/authentication/authentication_state.dart';
import 'package:realworldapp/blocs/authentication/authentication_event.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _usernameController;
  RegisterFormBloc _registerFormBloc;
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _registerFormBloc = RegisterFormBloc();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  void dispose() {
    _registerFormBloc?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
    _usernameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("AAAA")),
        body: BlocEventStateBuilder<AuthenticationState>(
            bloc: _authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if (state.isAuthenticating) {
                return PendingAction();
              } else if (state.isAuthenticated) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pop(true);
                });
              }
              return _buildForm();
            }));
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
                          _authenticationBloc.emitEvent(AuthenticationEvent(
                              event: AuthenticationEventType.registration,
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
