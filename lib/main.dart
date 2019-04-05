import 'package:flutter/material.dart';
import 'package:realworldapp/screens/users.dart';
import 'package:realworldapp/blocs/user_bloc.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      bloc: UserBloc(),
      child: MaterialApp(
        title: 'BLoC Samples',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Users(),
      ),
    );
  }
}
