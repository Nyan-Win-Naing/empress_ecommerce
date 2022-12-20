import 'package:json_annotation/json_annotation.dart';

part 'review_request_vo.g.dart';

@JsonSerializable()
class ReviewRequest {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "comment")
  String? comment;

  @JsonKey(name: "rating")
  int? rating;

  ReviewRequest({this.name, this.comment, this.rating});

  factory ReviewRequest.fromJson(Map<String, dynamic> json) => _$ReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewRequestToJson(this);
}