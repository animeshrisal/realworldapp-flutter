import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable(nullable: false)
class Author {
  final String username;
  final String image;
  final String bio;

  Author({this.username, this.image, this.bio});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
