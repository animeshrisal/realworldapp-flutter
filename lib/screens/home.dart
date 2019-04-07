import 'package:flutter/material.dart';
import 'package:realworldapp/screens/register.dart';
import 'package:realworldapp/screens/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text("AAAA"),
              ),
              ListTile(
                title: Text('Register'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => RegisterForm()));
                },
              ),
              ListTile(
                title: Text('Login'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LoginForm()));
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("AAAAA"),
        ),
        body: Text("AAAA"));
  }
}
