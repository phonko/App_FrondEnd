import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class Users {
  Users();

  late num id;
  late String name;
  late num age;
  late String address;
  late String email;
  late String password;
  
  factory Users.fromJson(Map<String,dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
