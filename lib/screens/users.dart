import 'package:flutter/material.dart';
import 'package:realworldapp/blocs/user_bloc.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';
import 'package:realworldapp/models/UserList.dart';

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shopping Page'),
        ),
        body: Container(
          child: StreamBuilder<UserList>(
            stream: bloc.userList,
            builder: (BuildContext context, AsyncSnapshot<UserList> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                    children: snapshot.data.userList
                        .map((item) => new Text(item.email))
                        .toList());
              }
            },
          ),
        ),
      ),
    );
  }
}
