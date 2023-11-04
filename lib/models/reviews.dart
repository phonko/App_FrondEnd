import 'package:json_annotation/json_annotation.dart';
import "review.dart";
part 'reviews.g.dart';

@JsonSerializable()
class Reviews {
  Reviews() : reviews = [];

  late List<Review> reviews;

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewsToJson(this);

  static Reviews filterlist(Reviews users, String filterString) {
    Reviews tempUsers = users;
    List<Review> usersList = tempUsers.reviews
        .where((u) =>
            (u.comment.toLowerCase().contains(filterString.toLowerCase())) ||
            (u.dates.toLowerCase().contains(filterString.toLowerCase())))
        .toList();
    users.reviews = usersList;
    return users;
  }
}
