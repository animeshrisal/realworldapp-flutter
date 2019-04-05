import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';

class RegisterEvent extends BlocEvent {
  RegisterEvent({this.event, this.email, this.password, this.username});

  final RegisterEventType event;
  final String email;
  final String password;
  final String username;
}

enum RegisterEventType {
  none,
  working,
}
