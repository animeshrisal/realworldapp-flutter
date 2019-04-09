import 'package:json_annotation/json_annotation.dart';
import 'package:realworldapp/models/author.dart';
import 'package:jaguar_orm/jaguar_orm.dart';

part 'article.jorm.dart';

part 'article.g.dart';

@JsonSerializable(nullable: false)
class Article {
  @PrimaryKey()
  final int id;
  final String title;
  final DateTime updatedAt;

  final String slug;

  final int favoriteCount;
  final bool favorited;
  final String description;
  final DateTime createdAt;
  final String body;

  @HasOne(AuthorBean)
  Author author;

  Article(
      {this.title,
      this.updatedAt,
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

@GenBean()
class ArticleBean extends Bean<Article> with _ArticleBean {
  ArticleBean(Adapter adapter)
      : authorBean = AuthorBean(adapter),
        super(adapter);

  final AuthorBean authorBean;

  String get tableName => 'article';
}
