import 'package:json_annotation/json_annotation.dart';
import 'package:realworldapp/models/article.dart';

part 'article_list.g.dart';

@JsonSerializable(nullable: false)
class ArticleList {
  final int articlesCount;
  final List<Article> articles;

  ArticleList({this.articlesCount, this.articles});

  factory ArticleList.fromJson(Map<String, dynamic> json) =>
      _$ArticleListFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleListToJson(this);
}
