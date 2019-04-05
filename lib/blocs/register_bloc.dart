import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:realworldapp/blocs/register_event.dart';
import 'package:realworldapp/blocs/register_state.dart';
import 'package:realworldapp/models/auth.dart';
import 'package:dio/dio.dart';

class RegisterBloc extends BlocEventStateBase<RegisterEvent, RegisterState> {
  final String _endPoint = "https://randomuser.me/api/";
  final Dio _dio = Dio();
  final Auth auth = Auth();

  RegisterBloc()
      : super(
          initialState: RegisterState.noAction(),
        );

  @override
  Stream<RegisterState> eventHandler(
      RegisterEvent event, RegisterState currentState) async* {
    if (event.event == RegisterEventType.working) {
      FormData formData = new FormData.from({
        "username": "wendux",
        "email": "animesh@gmail.com",
        "password": 'AAAA'
      });
    }
  }
}
