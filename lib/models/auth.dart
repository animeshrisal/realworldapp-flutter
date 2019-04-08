import 'package:jaguar_orm/jaguar_orm.dart';

part 'auth.jorm.dart';

class Auth {
  @PrimaryKey()
  String id;

  String jwt;

  Auth({this.id, this.jwt});
}

@GenBean()
class AuthBean extends Bean<Auth> with _AuthBean {
  AuthBean(Adapter adapter) : super(adapter);

  String get tableName => 'auth_user';
}
