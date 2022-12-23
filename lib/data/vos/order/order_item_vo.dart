import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_item_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_ORDER_ITEM_VO, adapterName: "OrderItemVOAdapter")
class OrderItemVO {
  @JsonKey(name: "name")
  @HiveField(0)
  String? name;

  @JsonKey(name: "price")
  @HiveField(1)
  double? price;

  @JsonKey(name: "quantity")
  @HiveField(2)
  int? quantity;

  @JsonKey(name: "image")
  @HiveField(3)
  String? image;

  @JsonKey(name: "item")
  @HiveField(4)
  String? item;

  @JsonKey(name: "_id")
  @HiveField(5)
  String? id;

  OrderItemVO({
    this.name,
    this.price,
    this.quantity,
    this.image,
    this.item,
    this.id,
  });

  factory OrderItemVO.fromJson(Map<String, dynamic> json) => _$OrderItemVOFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemVOToJson(this);

  @override
  String toString() {
    return 'OrderItemVO{name: $name, price: $price, quantity: $quantity}';
  }

  String getItemPrice() {
    return ((quantity ?? 0) * (price ?? 0)).toStringAsFixed(2);
  }
}
