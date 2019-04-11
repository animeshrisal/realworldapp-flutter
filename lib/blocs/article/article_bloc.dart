import 'package:rxdart/rxdart.dart';
import 'package:realworldapp/models/article_list.dart';
import 'package:realworldapp/models/article.dart';
import 'package:realworldapp/models/author.dart';
import 'package:realworldapp/global/network.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';

import 'package:realworldapp/global/adapter.dart';

class ArticleBloc extends BlocBase {
  final ArticleBean articleBean = ArticleBean(dbHelper.adapter);
  final AuthorBean authorBean = AuthorBean(dbHelper.adapter);
  final Network<List<Article>> network =
      Network<List<Article>>(url: "/articles");
  BehaviorSubject<List<Article>> _articleController =
      BehaviorSubject<List<Article>>();
  Stream<List<Article>> get items => _articleController;

  @override
  void dispose() {
    _articleController.close();
  }

  ArticleBloc() {
    _loadFromStorage();
    _loadArticles();
  }

  Future<Null> _loadFromStorage() async {
    _articleController.sink.add(await articleBean.getAll());
    dynamic test = await authorBean.getAll();
    print(test);
  }

  Future<Null> _loadArticles() async {
    ArticleList articleList =
        ArticleList.fromJson(await network.getResponse(null));

    try {
      articleBean.upsertMany(articleList.articles, cascade: true);
      print("inserted");
    } catch (e) {
      print(e);
    }
    _articleController.sink.add(articleList.articles);
  }
}
