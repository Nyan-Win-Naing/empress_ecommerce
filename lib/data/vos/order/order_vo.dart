import 'package:empress_ecommerce_app/data/vos/order/delivery_address_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_item_vo.dart';
import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_ORDER_VO, adapterName: "OrderVOAdapter")
class OrderVO {
  @JsonKey(name: "deliveryAddress")
  @HiveField(0)
  DeliveryAddressVO? deliveryAddress;

  @JsonKey(name: "orderItems")
  @HiveField(1)
  List<OrderItemVO>? orderItems;

  @JsonKey(name: "user")
  @HiveField(2)
  String? user;

  @JsonKey(name: "paymentMethod")
  @HiveField(3)
  String? paymentMethod;

  @JsonKey(name: "itemsPrice")
  @HiveField(4)
  double? itemsPrice;

  @JsonKey(name: "deliveryPrice")
  @HiveField(5)
  double? deliveryPrice;

  @JsonKey(name: "taxPrice")
  @HiveField(6)
  double? taxPrice;

  @JsonKey(name: "totalPrice")
  @HiveField(7)
  double? totalPrice;

  @JsonKey(name: "isDelivered")
  @HiveField(8)
  bool? isDelivered;

  @JsonKey(name: "isPaid")
  @HiveField(9)
  bool? isPaid;

  @JsonKey(name: "_id")
  @HiveField(10)
  String? id;

  @JsonKey(name: "createdAt")
  @HiveField(11)
  String? createdAt;

  @JsonKey(name: "updatedAt")
  @HiveField(12)
  String? updatedAt;

  @JsonKey(name: "__v")
  @HiveField(13)
  int? v;

  OrderVO({
    this.deliveryAddress,
    this.orderItems,
    this.user,
    this.paymentMethod,
    this.itemsPrice,
    this.deliveryPrice,
    this.taxPrice,
    this.totalPrice,
    this.isDelivered,
    this.isPaid,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory OrderVO.fromJson(Map<String, dynamic> json) =>
      _$OrderVOFromJson(json);

  Map<String, dynamic> toJson() => _$OrderVOToJson(this);

  String getFormattedDate() {
    if(createdAt != null) {
      return createdAt?.split("T").first ?? "";
    } else {
      return "";
    }
  }
}
