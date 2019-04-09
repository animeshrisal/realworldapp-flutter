// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_article_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostArticleRequest _$PostArticleRequestFromJson(Map<String, dynamic> json) {
  return PostArticleRequest(
      title: json['title'] as String,
      description: json['description'] as String,
      body: json['body'] as String,
      tagList: (json['tagList'] as List).map((e) => e as String).toList());
}

Map<String, dynamic> _$PostArticleRequestToJson(PostArticleRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'body': instance.body,
      'tagList': instance.tagList
    };
