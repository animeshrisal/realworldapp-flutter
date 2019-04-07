import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:realworldapp/blocs/registration/register_event.dart';
import 'package:realworldapp/blocs/registration/register_state.dart';
import 'package:realworldapp/models/auth.dart';
import 'package:dio/dio.dart';

class RegisterBloc extends BlocEventStateBase<RegisterEvent, RegisterState> {
  final String _endPoint = "http://192.168.31.55:4000/users";
  final Dio _dio = Dio();
  final Auth auth = Auth();

  RegisterBloc()
      : super(
          initialState: RegisterState.noAction(),
        );

  @override
  Stream<RegisterState> eventHandler(
      RegisterEvent event, RegisterState currentState) async* {
    print("BBBB");
    if (event.event == RegisterEventType.working) {
      yield RegisterState.busy();
      Response response = await _dio.post(_endPoint, data: {
        "user": {
          "username": event.username,
          "email": event.email,
          "password": event.password
        },
      });

      print(response.statusCode);
      if (response.statusCode == 201) {
        yield RegisterState.success();
      } else {
        yield RegisterState.failure();
      }
    }
  }
}
