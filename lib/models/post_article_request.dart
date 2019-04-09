import 'package:json_annotation/json_annotation.dart';

part 'post_article_request.g.dart';

@JsonSerializable(nullable: false)
class PostArticleRequest {
  final String title;
  final String description;
  final String body;
  final List<String> tagList;

  PostArticleRequest({this.title, this.description, this.body, this.tagList});

  factory PostArticleRequest.fromJson(Map<String, dynamic> json) =>
      _$PostArticleRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PostArticleRequestToJson(this);
}
