import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_REVIEW_VO, adapterName: "ReviewVOAdapter")
class ReviewVO {
  @JsonKey(name: "name")
  @HiveField(0)
  String? name;

  @JsonKey(name: "comment")
  @HiveField(1)
  String? comment;

  @JsonKey(name: "rating")
  @HiveField(2)
  int? rating;

  @JsonKey(name: "_id")
  @HiveField(3)
  String? id;

  @JsonKey(name: "createdAt")
  @HiveField(4)
  String? createdAt;

  @JsonKey(name: "updatedAt")
  @HiveField(5)
  String? updatedAt;

  ReviewVO({
    this.name,
    this.comment,
    this.rating,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory ReviewVO.fromJson(Map<String, dynamic> json) => _$ReviewVOFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewVOToJson(this);
}
