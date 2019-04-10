import 'package:flutter/material.dart';
import 'package:realworldapp/blocs/article/article_bloc.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';
import 'package:realworldapp/models/article_list.dart';

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  ArticleBloc _articleBloc;

  @override
  void initState() {
    super.initState();
    _articleBloc = BlocProvider.of<ArticleBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ArticleList>(
      stream: _articleBloc.items,
      builder: (BuildContext context, AsyncSnapshot<ArticleList> snapshot) {
        return snapshot.hasData ? data(snapshot.data) : Text("AAA");
      },
    );
  }

  Widget data(ArticleList data) {
    return Text(data.articlesCount.toString());
  }
}
