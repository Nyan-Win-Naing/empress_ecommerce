import 'package:empress_ecommerce_app/data/vos/review_vo.dart';
import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part "item_vo.g.dart";

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_ITEM_VO, adapterName: "ItemVOAdapter")
class ItemVO {
  @JsonKey(name: "_id")
  @HiveField(0)
  String? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  @JsonKey(name: "modelName")
  @HiveField(2)
  String? modelName;

  @JsonKey(name: "brand")
  @HiveField(3)
  String? brand;

  @JsonKey(name: "price")
  @HiveField(4)
  double? price;

  @JsonKey(name: "operatingSystem")
  @HiveField(5)
  String? operatingSystem;

  @JsonKey(name: "graphicCard")
  @HiveField(6)
  String? graphicCard;

  @JsonKey(name: "description")
  @HiveField(7)
  String? description;

  @JsonKey(name: "rating")
  @HiveField(8)
  double? rating;

  @JsonKey(name: "category")
  @HiveField(9)
  String? category;

  @JsonKey(name: "image")
  @HiveField(10)
  String? image;

  @JsonKey(name: "images")
  @HiveField(11)
  List<String>? images;

  @JsonKey(name: "inStock")
  @HiveField(12)
  int? inStock;

  @JsonKey(name: "numberOfReviews")
  @HiveField(13)
  int? numberOfReviews;

  @JsonKey(name: "reviews")
  @HiveField(14)
  List<ReviewVO>? reviews;

  @JsonKey(name: "createdAt")
  @HiveField(15)
  String? createdAt;

  @JsonKey(name: "updatedAt")
  @HiveField(16)
  String? updatedAt;

  @JsonKey(name: "__v")
  @HiveField(17)
  int? v;

  ItemVO({
    this.id,
    this.name,
    this.modelName,
    this.brand,
    this.price,
    this.operatingSystem,
    this.graphicCard,
    this.description,
    this.rating,
    this.category,
    this.image,
    this.images,
    this.inStock,
    this.numberOfReviews,
    this.reviews,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ItemVO.fromJson(Map<String, dynamic> json) => _$ItemVOFromJson(json);

  Map<String, dynamic> toJson() => _$ItemVOToJson(this);

  @override
  String toString() {
    return 'ItemVO{name: $name}';
  }
}
