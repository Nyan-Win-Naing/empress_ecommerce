// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_address_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeliveryAddressVOAdapter extends TypeAdapter<DeliveryAddressVO> {
  @override
  final int typeId = 5;

  @override
  DeliveryAddressVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeliveryAddressVO(
      fullName: fields[0] as String?,
      address: fields[1] as String?,
      city: fields[2] as String?,
      addressState: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DeliveryAddressVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.addressState);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeliveryAddressVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryAddressVO _$DeliveryAddressVOFromJson(Map<String, dynamic> json) =>
    DeliveryAddressVO(
      fullName: json['fullName'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      addressState: json['addressState'] as String?,
    );

Map<String, dynamic> _$DeliveryAddressVOToJson(DeliveryAddressVO instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'address': instance.address,
      'city': instance.city,
      'addressState': instance.addressState,
    };
