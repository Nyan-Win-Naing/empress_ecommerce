import 'package:empress_ecommerce_app/data/vos/review_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_review_response.g.dart';

@JsonSerializable()
class PostReviewResponse {
  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "review")
  ReviewVO? review;

  @JsonKey(name: "numberOfReviews")
  int? numberOfReviews;

  @JsonKey(name: "rating")
  double? rating;

  PostReviewResponse({
    this.message,
    this.review,
    this.numberOfReviews,
    this.rating,
  });

  factory PostReviewResponse.fromJson(Map<String, dynamic> json) => _$PostReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostReviewResponseToJson(this);
}
