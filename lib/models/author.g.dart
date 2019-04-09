// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
      username: json['username'] as String,
      image: json['image'] as String,
      bio: json['bio'] as String);
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'username': instance.username,
      'image': instance.image,
      'bio': instance.bio
    };
