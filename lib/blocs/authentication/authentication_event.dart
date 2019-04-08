import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';

class AuthenticationEvent extends BlocEvent {
  AuthenticationEvent(
      {this.event, this.jwt, this.email, this.password, this.username});

  final AuthenticationEventType event;
  final String jwt;
  final String email;
  final String password;
  final String username;
}

enum AuthenticationEventType {
  none,
  registration,
  authentication,
  checkLocalStorage,
  logout
}
