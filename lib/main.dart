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

SqfliteAdapter _adapter;

void main() async {
  String dbPath = await getDatabasesPath();
  _adapter = SqfliteAdapter(path.join(dbPath, "test.db"));

  try {
    await _adapter.connect();
    final authBean = AuthBean(_adapter);

    await authBean.createTable(ifNotExists: true);

    _adapter.close();
  } catch (e) {
    print(e);
  }
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
        bloc: AuthenticationBloc(),
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
