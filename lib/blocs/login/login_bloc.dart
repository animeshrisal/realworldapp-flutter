import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:realworldapp/blocs/login/login_event.dart';
import 'package:realworldapp/blocs/login/login_state.dart';
import 'package:dio/dio.dart';

class LoginBloc extends BlocEventStateBase<LoginEvent, LoginState> {
  final String _endPoint = "http://192.168.31.55:4000/users";
  final Dio _dio = Dio();

  LoginBloc()
      : super(
          initialState: LoginState.noAction(),
        );

  @override
  Stream<LoginState> eventHandler(
      LoginEvent event, LoginState currentState) async* {
    print("BBBB");
    if (event.event == LoginEventType.working) {
      yield LoginState.busy();
      Response response = await _dio.post(_endPoint, data: {
        "user": {"email": event.email, "password": event.password},
      });

      print(response.statusCode);
      if (response.statusCode == 201) {
        yield LoginState.success();
      } else {
        yield LoginState.failure();
      }
    }
  }
}
