import 'package:json_annotation/json_annotation.dart';
import "users.dart";
import "video.dart";
part 'review.g.dart';

@JsonSerializable()
class Review {
  Review();

  late num id;
  late Users users;
  late Video video;
  late String comment;
  late String dates;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
