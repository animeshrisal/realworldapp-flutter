import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';

class LoginState extends BlocState {
  LoginState({
    this.isBusy: false,
    this.isSuccess: false,
    this.isFailure: false,
  });

  final bool isBusy;
  final bool isSuccess;
  final bool isFailure;

  factory LoginState.noAction() {
    return LoginState();
  }

  factory LoginState.busy() {
    return LoginState(
      isBusy: true,
    );
  }

  factory LoginState.success() {
    return LoginState(
      isSuccess: true,
    );
  }

  factory LoginState.failure() {
    return LoginState(
      isFailure: true,
    );
  }
}
