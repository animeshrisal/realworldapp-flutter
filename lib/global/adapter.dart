import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:realworldapp/models/auth.dart';
import 'package:realworldapp/models/article.dart';
import 'package:realworldapp/models/author.dart';

class DbHelper {
  SqfliteAdapter adapter;
  String dbPath;

  Future initialize() async {
    dbPath = await getDatabasesPath();
    adapter = SqfliteAdapter(path.join(dbPath, "test.db"));
    try {
      /*
      */
      await adapter.connect();

      final authBean = AuthBean(adapter);
      final articleBean = ArticleBean(adapter);
      final authorBean = AuthorBean(adapter);

      //await articleBean.drop();
      //await authorBean.drop();
      await authBean.createTable(ifNotExists: true);
      await articleBean.createTable(ifNotExists: true);
      await authorBean.createTable(ifNotExists: true);
    } catch (e) {
      print(e);
    }
  }
}

DbHelper dbHelper = DbHelper();
