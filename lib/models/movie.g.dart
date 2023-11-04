// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie()
  ..id = json['id'] as num
  ..name = json['name'] as String
  ..imgage = json['imgage'] as String
  ..video = json['video'] as String
  ..type = json['type'] as String
  ..description = json['description'] as String;

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgage': instance.imgage,
      'video': instance.video,
      'type': instance.type,
      'description': instance.description,
    };
