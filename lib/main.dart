import 'package:flutter/material.dart';
import 'package:realworldapp/screens/register.dart';
import 'package:realworldapp/screens/home.dart';
import 'package:realworldapp/screens/login.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:realworldapp/models/auth.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';
import 'package:realworldapp/blocs/authentication/authentication_bloc.dart';

void main() async {
  SqfliteAdapter _adapter;
  String dbPath = await getDatabasesPath();
  _adapter = SqfliteAdapter(path.join(dbPath, "test.db"));

  try {
    await _adapter.connect();
    final authBean = AuthBean(_adapter);

    await authBean.createTable(ifNotExists: true);
  } catch (e) {
    print(e);
  }
  return runApp(MyApp(adapter: _adapter));
}

class MyApp extends StatelessWidget {
  final SqfliteAdapter adapter;
  @override
  MyApp({this.adapter});
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
        bloc: AuthenticationBloc(adapter: adapter),
        child: MaterialApp(
            title: 'BLoC Samples',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomePage(),
            initialRoute: '/',
            routes: {
              '/register': (context) => RegisterForm(),
              '/login': (context) => LoginForm(),
            }));
  }
}
