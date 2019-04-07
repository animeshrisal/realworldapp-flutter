import 'package:flutter/material.dart';
import 'package:realworldapp/screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Samples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("AAAAA"),
          ),
          body: RegisterForm()),
    );
  }
}
