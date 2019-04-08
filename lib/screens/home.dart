import 'package:flutter/material.dart';
import 'package:realworldapp/screens/register.dart';
import 'package:realworldapp/screens/login.dart';
import 'package:realworldapp/screens/add_article.dart';
import 'package:realworldapp/screens/articles.dart';
import 'package:realworldapp/screens/users_page.dart';
import 'package:realworldapp/blocs/authentication/authentication_bloc.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';
import 'package:realworldapp/blocs/authentication/authentication_event.dart';
import 'package:realworldapp/bloc_widgets/bloc_state_builder.dart';
import 'package:realworldapp/blocs/authentication/authentication_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    super.initState();
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    authenticationBloc.emitEvent(AuthenticationEvent());
  }

  int _currentIndex = 0;
  final List<Widget> _children = [Articles(), AddArticle(), UsersPage()];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget drawer() {
    return ListView(children: <Widget>[
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
    ]);
  }

  Widget userDrawer() {
    return ListView(children: <Widget>[
      DrawerHeader(
        child: Text("Profile"),
      ),
      ListTile(
        title: Text('Register'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => RegisterForm()));
        },
      ),
      ListTile(
          title: Text('Logout'),
          onTap: () {
            authenticationBloc.emitEvent(
                AuthenticationEvent(event: AuthenticationEventType.logout));
          })
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: BlocEventStateBuilder<AuthenticationState>(
                bloc: authenticationBloc,
                builder: (BuildContext context, AuthenticationState state) {
                  if (state.isAuthenticated) {
                    return userDrawer();
                  } else {
                    return drawer();
                  }
                })),
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
