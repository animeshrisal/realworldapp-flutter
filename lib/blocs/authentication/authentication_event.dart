import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';

abstract class AuthenticationEvent extends BlocEvent {
  final String jwt;

  AuthenticationEvent({
    this.jwt: '',
  });
}

class AuthenticationEventLogin extends AuthenticationEvent {
  AuthenticationEventLogin({
    String jwt,
  }) : super(
          jwt: jwt,
        );
}

class AuthenticationEventLogout extends AuthenticationEvent {}
