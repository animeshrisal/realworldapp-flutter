import 'package:realworldapp/bloc_helpers/bloc_provider.dart';
import 'package:realworldapp/models/User.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';
import 'package:realworldapp/models/UserList.dart';

class UserBloc extends BlocBase {
  Set<User> _users = Set<User>();
  final String _endPoint = "https://randomuser.me/api/?results=10";
  final Dio _dio = Dio();

  BehaviorSubject<UserList> _userListController = BehaviorSubject<UserList>();
  Stream<UserList> get userList => _userListController;

  UserBloc() {
    getUser();
  }

  @override
  void dispose() {
    _userListController.close();
  }

  Future<Null> getUser() async {
    try {
      Response response = await _dio.get(_endPoint);
      _userListController.sink.add(UserList.fromJson(response.data));
    } catch (error) {
      return null;
    }
  }
}
