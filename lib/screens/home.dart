import 'package:flutter/material.dart';
import 'package:realworldapp/screens/register.dart';
import 'package:realworldapp/screens/login.dart';
import 'package:realworldapp/screens/add_article.dart';
import 'package:realworldapp/screens/articles.dart';
import 'package:realworldapp/screens/users_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [Articles(), AddArticle(), UsersPage()];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text("Blog"),
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
          title: Text("Home"),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Articles")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit), title: Text("New Post")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text("Search"))
            ]));
  }
}
