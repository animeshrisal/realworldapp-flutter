import 'package:flutter/material.dart';
import 'package:realworldapp/screens/register.dart';
import 'package:realworldapp/screens/home.dart';
import 'package:realworldapp/screens/login.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';
import 'package:realworldapp/blocs/authentication/authentication_bloc.dart';
import 'package:realworldapp/blocs/article/article_bloc.dart';
import 'package:realworldapp/global/adapter.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

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
            child: new DynamicTheme(
                defaultBrightness: Brightness.light,
                data: (brightness) => ThemeData(
                    primarySwatch: Colors.indigo, brightness: brightness),
                themedWidgetBuilder: (context, theme) {
                  return MaterialApp(
                      title: 'BLoC Samples',
                      theme: theme,
                      home: HomePage(),
                      initialRoute: '/',
                      routes: {
                        '/register': (context) => RegisterForm(),
                        '/login': (context) => LoginForm(),
                      });
                })));
  }
}
