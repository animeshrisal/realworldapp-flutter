import 'package:flutter/material.dart';
import 'package:realworldapp/screens/register.dart';
import 'package:realworldapp/screens/home.dart';
import 'package:realworldapp/screens/login.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';
import 'package:realworldapp/blocs/authentication/authentication_bloc.dart';
import 'package:realworldapp/blocs/article/article_bloc.dart';
import 'package:realworldapp/global/adapter.dart';

void main() async {
  await dbHelper.initialize();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  MyApp();
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
        bloc: AuthenticationBloc(),
        child: BlocProvider<ArticleBloc>(
            bloc: ArticleBloc(),
            child: MaterialApp(
                title: 'BLoC Samples',
                theme: ThemeData(
                    primarySwatch: Colors.blue, brightness: Brightness.dark),
                home: HomePage(),
                initialRoute: '/',
                routes: {
                  '/register': (context) => RegisterForm(),
                  '/login': (context) => LoginForm(),
                })));
  }
}
