import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_list_response.g.dart';

@JsonSerializable()
class ItemListResponse {
  @JsonKey(name: "items")
  List<ItemVO>? items;

  @JsonKey(name: "countItems")
  int? countItems;

  @JsonKey(name: "page")
  String? page;

  @JsonKey(name: "pages")
  int? pages;

  ItemListResponse({this.items, this.countItems, this.page, this.pages});

  factory ItemListResponse.fromJson(Map<String, dynamic> json) => _$ItemListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemListResponseToJson(this);
}