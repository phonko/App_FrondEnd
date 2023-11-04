// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users()
  ..id = json['id'] as num
  ..name = json['name'] as String
  ..age = json['age'] as num
  ..address = json['address'] as String
  ..email = json['email'] as String
  ..password = json['password'] as String;

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'address': instance.address,
      'email': instance.email,
      'password': instance.password,
    };
