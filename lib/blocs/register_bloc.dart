import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:realworldapp/blocs/register_event.dart';
import 'package:realworldapp/blocs/register_state.dart';

class RegisterBloc extends BlocEventStateBase<RegisterEvent, RegisterState> {
  RegisterBloc()
      : super(
          initialState: RegisterState.noAction(),
        );

  @override
  Stream<RegisterState> eventHandler(
      RegisterEvent event, RegisterState currentState) async* {
    if (event.event == RegisterEventType.working) {
      yield RegisterState.busy();
      print('Register of ${event.email}/${event.password}');

      await Future.delayed(const Duration(seconds: 1));

      yield RegisterState.success();
    }
  }
}
