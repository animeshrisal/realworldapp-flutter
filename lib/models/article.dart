import 'package:json_annotation/json_annotation.dart';
import 'package:realworldapp/models/author.dart';

part 'article.g.dart';

@JsonSerializable(nullable: false)
class Article {
  final String title;
  final DateTime updatedAt;
  final List<String> tagList;
  final String slug;
  final int id;
  final int favoriteCount;
  final bool favorited;
  final String description;
  final DateTime createdAt;
  final String body;
  final Author author;

  Article(
      {this.title,
      this.updatedAt,
      this.tagList,
      this.slug,
      this.id,
      this.favoriteCount,
      this.favorited,
      this.description,
      this.createdAt,
      this.body,
      this.author});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
