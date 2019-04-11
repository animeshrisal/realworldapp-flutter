import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:realworldapp/models/auth.dart';

class DbHelper {
  SqfliteAdapter adapter;
  String dbPath;

  Future initialize() async {
    print("REEEEEE");
    dbPath = await getDatabasesPath();
    adapter = SqfliteAdapter(path.join(dbPath, "test.db"));
    try {
      await adapter.connect();
      final authBean = AuthBean(adapter);

      await authBean.createTable(ifNotExists: true);
    } catch (e) {
      print(e);
    }
  }
}

DbHelper dbHelper = DbHelper();
