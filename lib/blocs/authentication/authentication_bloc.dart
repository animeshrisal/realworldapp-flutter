import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:realworldapp/blocs/authentication/authentication_event.dart';
import 'package:realworldapp/blocs/authentication/authentication_state.dart';
import 'package:realworldapp/models/auth.dart';
import 'package:dio/dio.dart';
import 'package:realworldapp/global/adapter.dart';

class AuthenticationBloc
    extends BlocEventStateBase<AuthenticationEvent, AuthenticationState> {
  final String _endPoint = "http://192.168.31.55:4000/users";
  final Dio _dio = Dio();
  AuthenticationBloc()
      : super(
          initialState: AuthenticationState.checkLocalStorage(),
        );

  @override
  Stream<AuthenticationState> eventHandler(
      AuthenticationEvent event, AuthenticationState currentState) async* {
    print(currentState.isCheckingLocalStorage);
    if (currentState.isCheckingLocalStorage) {
      print('checkingLocalStorage');
      final authBean = AuthBean(dbHelper.adapter);
      try {
        Auth auth = await authBean.find('0');
        print("Found jwt");
        yield AuthenticationState.authenticated(auth.jwt);
      } catch (e) {
        print("Didnt find jwt");
        yield AuthenticationState.failure();
        print(e);
      }
    }

    if (event.event == AuthenticationEventType.registration) {
      Response response = await _dio.post(_endPoint, data: {
        "user": {
          "username": event.username,
          "email": event.email,
          "password": event.password
        },
      });

      if (response.statusCode == 201) {
        print(response.data['user']['token']);

        final authBean = AuthBean(dbHelper.adapter);
        try {
          Auth auth = new Auth(id: '0', jwt: response.data['user']['token']);

          await authBean.upsert(auth);
          yield AuthenticationState.authenticated(
              response.data['user']['token']);
          print("Saved");
        } catch (e) {
          yield AuthenticationState.failure();
          print(e);
        }
      } else {
        print('yeet');
      }
    }
    if (event.event == AuthenticationEventType.authentication) {
      Response response = await _dio.post("$_endPoint/login", data: {
        "user": {"email": event.email, "password": event.password},
      });

      if (response.statusCode == 201) {
        print(response.data['user']['token']);

        final authBean = AuthBean(dbHelper.adapter);
        try {
          Auth auth = new Auth(id: '0', jwt: response.data['user']['token']);

          await authBean.upsert(auth);
          yield AuthenticationState.authenticated(
              response.data['user']['token']);
          print("Saved");
        } catch (e) {
          yield AuthenticationState.failure();
          print(e);
        }
      } else {
        print('yeet');
      }

      print(response.data['user']['token']);
    }

    if (event.event == AuthenticationEventType.logout) {
      yield AuthenticationState.logout();
    }
  }
}
