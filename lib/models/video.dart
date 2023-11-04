import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  Video();

  late num id;
  late String name;
  late String imgage;
  late String video;
  late String type;
  late String description;
  
  factory Video.fromJson(Map<String,dynamic> json) => _$VideoFromJson(json);
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
