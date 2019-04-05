import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';

class RegisterState extends BlocState {
  RegisterState({
    this.isBusy: false,
    this.isSuccess: false,
    this.isFailure: false,
  });

  final bool isBusy;
  final bool isSuccess;
  final bool isFailure;

  factory RegisterState.noAction() {
    return RegisterState();
  }

  factory RegisterState.busy() {
    return RegisterState(
      isBusy: true,
    );
  }

  factory RegisterState.success() {
    return RegisterState(
      isSuccess: true,
    );
  }

  factory RegisterState.failure() {
    return RegisterState(
      isFailure: true,
    );
  }
}
