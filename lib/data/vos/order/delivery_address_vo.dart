import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_address_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_DELIVERY_ADDRESS_VO, adapterName: "DeliveryAddressVOAdapter")
class DeliveryAddressVO {
  @JsonKey(name: "fullName")
  @HiveField(0)
  String? fullName;

  @JsonKey(name: "address")
  @HiveField(1)
  String? address;

  @JsonKey(name: "city")
  @HiveField(2)
  String? city;

  @JsonKey(name: "addressState")
  @HiveField(3)
  String? addressState;

  DeliveryAddressVO({
    this.fullName,
    this.address,
    this.city,
    this.addressState,
  });

  factory DeliveryAddressVO.fromJson(Map<String, dynamic> json) => _$DeliveryAddressVOFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryAddressVOToJson(this);

  @override
  String toString() {
    return 'DeliveryAddressVO{fullName: $fullName, address: $address, city: $city, addressState: $addressState}';
  }
}
