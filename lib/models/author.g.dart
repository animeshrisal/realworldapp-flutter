// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
      id: json['id'] as int,
      username: json['username'] as String,
      image: json['image'] as String,
      bio: json['bio'] as String)
    ..postId = json['postId'] as int;
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'bio': instance.bio,
      'postId': instance.postId
    };
