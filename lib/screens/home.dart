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
      body: DefaultTabController(
          length: 3,
          child: new Scaffold(
              body:
                  TabBarView(children: [Articles(), AddArticle(), UsersPage()]),
              bottomNavigationBar: new TabBar(
                tabs: [
                  Tab(
                    icon: new Icon(Icons.home),
                  ),
                  Tab(
                    icon: new Icon(Icons.rss_feed),
                  ),
                  Tab(
                    icon: new Icon(Icons.perm_identity),
                  ),
                ],
                labelColor: Colors.yellow,
                unselectedLabelColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.red,
              ))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        elevation: 1,
      ),
    );
  }
}
