import 'package:rxdart/rxdart.dart';
import 'package:realworldapp/models/article_list.dart';
import 'package:realworldapp/global/network.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';

class ArticleBloc extends BlocBase {
  final Network<ArticleList> network = Network<ArticleList>(url: "/articles");
  BehaviorSubject<ArticleList> _articleController =
      BehaviorSubject<ArticleList>();
  Stream<ArticleList> get items => _articleController;

  @override
  void dispose() {
    _articleController.close();
  }

  ArticleBloc() {
    _loadArticles();
  }

  Future<Null> _loadArticles() async {
    _articleController.sink
        .add(ArticleList.fromJson(await network.getResponse(null)));
  }
}
