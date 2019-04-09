// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleList _$ArticleListFromJson(Map<String, dynamic> json) {
  return ArticleList(
      articlesCount: json['articlesCount'] as int,
      articles: (json['articles'] as List)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList());
}

Map<String, dynamic> _$ArticleListToJson(ArticleList instance) =>
    <String, dynamic>{
      'articlesCount': instance.articlesCount,
      'articles': instance.articles
    };
