// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review()
  ..id = json['id'] as num
  ..users = Users.fromJson(json['users'] as Map<String, dynamic>)
  ..video = Video.fromJson(json['video'] as Map<String, dynamic>)
  ..comment = json['comment'] as String
  ..dates = json['dates'] as String;

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'users': instance.users,
      'video': instance.video,
      'comment': instance.comment,
      'dates': instance.dates,
    };
