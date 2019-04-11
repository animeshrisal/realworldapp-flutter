import 'package:json_annotation/json_annotation.dart';
import 'package:realworldapp/models/article.dart';
import 'package:jaguar_orm/jaguar_orm.dart';

part 'author.jorm.dart';
part 'author.g.dart';

@JsonSerializable(nullable: false)
class Author {
  @PrimaryKey(auto: true)
  int id;

  final String username;

  @Column(isNullable: true)
  final String image;

  @Column(isNullable: true)
  final String bio;

  @BelongsTo(ArticleBean)
  int articleId;

  Author({this.username, this.image, this.bio});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@GenBean()
class AuthorBean extends Bean<Author> with _AuthorBean {
  ArticleBean _articleBean;

  ArticleBean get articleBean => _articleBean ??= ArticleBean(adapter);
  AuthorBean(Adapter adapter) : super(adapter);

  String get tableName => 'authors';
}
