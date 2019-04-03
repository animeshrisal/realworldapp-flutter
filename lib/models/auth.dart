import 'package:jaguar_orm/jaguar_orm.dart';

part 'auth.jorm.dart';

class Auth {
  String jwt;

  Auth({this.jwt});
}

@GenBean()
class AuthBean extends Bean<Auth> with _AuthBean {
  AuthBean(Adapter adapter) : super(adapter);

  String get tableName => 'auth_user';
}
