import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';

class LoginEvent extends BlocEvent {
  LoginEvent({this.event, this.email, this.password});

  final LoginEventType event;
  final String email;
  final String password;
}

enum LoginEventType {
  none,
  working,
}
