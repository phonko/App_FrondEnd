import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  Movie();

  late num id;
  late String name;
  late String imgage;
  late String video;
  late String type;
  late String description;
  
  factory Movie.fromJson(Map<String,dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
