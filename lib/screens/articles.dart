import 'package:flutter/material.dart';
import 'package:realworldapp/blocs/article/article_bloc.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';
import 'package:realworldapp/models/article.dart';

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
    return Container(
        child: StreamBuilder<List<Article>>(
      stream: _articleBloc.items,
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        return snapshot.hasData ? data(snapshot.data) : Text("AAA");
      },
    ));
  }

  Widget data(List<Article> data) {
    return Column(
        children: data.map((item) => Text(item.id.toString())).toList());
  }
}
