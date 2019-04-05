import 'package:realworldapp/models/User.dart';

class UserList {
  final List<User> userList;

  UserList({this.userList});

  UserList.fromJson(Map<String, dynamic> json)
      : userList =
            (json["results"] as List).map((i) => new User.fromJson(i)).toList();
}
