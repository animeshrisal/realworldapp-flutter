import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:realworldapp/blocs/authentication/authentication_event.dart';
import 'package:realworldapp/blocs/authentication/authentication_state.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:realworldapp/models/auth.dart';
import 'package:dio/dio.dart';

SqfliteAdapter _adapter;

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
      String dbPath = await getDatabasesPath();
      _adapter = SqfliteAdapter(path.join(dbPath, "test.db"));
      await _adapter.connect();
      final authBean = AuthBean(_adapter);
      try {
        Auth auth = await authBean.find('0');
        yield AuthenticationState.authenticated(auth.jwt);
        print("Found jwt");
      } catch (e) {
        yield AuthenticationState.failure();
        print("Didnt find");
      }
      _adapter.close();
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
        print(response);
      } else {
        print('yeet');
      }
    }
    if (event.event == AuthenticationEventType.authentication) {}
  }
}
