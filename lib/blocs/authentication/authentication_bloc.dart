import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:realworldapp/blocs/authentication/authentication_event.dart';
import 'package:realworldapp/blocs/authentication/authentication_state.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:realworldapp/models/auth.dart';

SqfliteAdapter _adapter;

class AuthenticationBloc
    extends BlocEventStateBase<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(
          initialState: AuthenticationState.notAuthenticated(),
        );

  Future<String> getFromTable() async {}

  @override
  Stream<AuthenticationState> eventHandler(
      AuthenticationEvent event, AuthenticationState currentState) async* {
    if (event is AuthenticationEventLogin) {
      yield AuthenticationState.authenticating();

      String dbPath = await getDatabasesPath();
      _adapter = SqfliteAdapter(path.join(dbPath, "test.db"));
      await _adapter.connect();
      final authBean = AuthBean(_adapter);
      try {
        Auth auth = await authBean.find('0');
        yield AuthenticationState.authenticated(auth.jwt);
      } catch (e) {
        yield AuthenticationState.failure();
      }
      _adapter.close();
    }

    if (event is AuthenticationEventLogout) {
      yield AuthenticationState.notAuthenticated();
    }
  }
}
