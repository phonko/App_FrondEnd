// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reviews _$ReviewsFromJson(Map<String, dynamic> json) => Reviews()
  ..reviews = (json['reviews'] as List<dynamic>)
      .map((e) => Review.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
      'reviews': instance.reviews,
    };
