// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
      title: json['title'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      tagList: (json['tagList'] as List).map((e) => e as String).toList(),
      slug: json['slug'] as String,
      id: json['id'] as int,
      favoriteCount: json['favoriteCount'] as int,
      favorited: json['favorited'] as bool,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      body: json['body'] as String,
      author: Author.fromJson(json['author'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'tagList': instance.tagList,
      'slug': instance.slug,
      'id': instance.id,
      'favoriteCount': instance.favoriteCount,
      'favorited': instance.favorited,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'body': instance.body,
      'author': instance.author
    };
