import 'package:empress_ecommerce_app/data/vos/order/order_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_order_response.g.dart';

@JsonSerializable()
class NewOrderResponse {
  @JsonKey(name: "success")
  bool? success;

  @JsonKey(name: "order")
  OrderVO? order;

  NewOrderResponse({this.success, this.order});

  factory NewOrderResponse.fromJson(Map<String, dynamic> json) => _$NewOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewOrderResponseToJson(this);
}