// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderVOAdapter extends TypeAdapter<OrderVO> {
  @override
  final int typeId = 7;

  @override
  OrderVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderVO(
      deliveryAddress: fields[0] as DeliveryAddressVO?,
      orderItems: (fields[1] as List?)?.cast<OrderItemVO>(),
      user: fields[2] as String?,
      paymentMethod: fields[3] as String?,
      itemsPrice: fields[4] as double?,
      deliveryPrice: fields[5] as double?,
      taxPrice: fields[6] as double?,
      totalPrice: fields[7] as double?,
      isDelivered: fields[8] as bool?,
      isPaid: fields[9] as bool?,
      id: fields[10] as String?,
      createdAt: fields[11] as String?,
      updatedAt: fields[12] as String?,
      v: fields[13] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderVO obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.deliveryAddress)
      ..writeByte(1)
      ..write(obj.orderItems)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.paymentMethod)
      ..writeByte(4)
      ..write(obj.itemsPrice)
      ..writeByte(5)
      ..write(obj.deliveryPrice)
      ..writeByte(6)
      ..write(obj.taxPrice)
      ..writeByte(7)
      ..write(obj.totalPrice)
      ..writeByte(8)
      ..write(obj.isDelivered)
      ..writeByte(9)
      ..write(obj.isPaid)
      ..writeByte(10)
      ..write(obj.id)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt)
      ..writeByte(13)
      ..write(obj.v);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderVO _$OrderVOFromJson(Map<String, dynamic> json) => OrderVO(
      deliveryAddress: json['deliveryAddress'] == null
          ? null
          : DeliveryAddressVO.fromJson(
              json['deliveryAddress'] as Map<String, dynamic>),
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItemVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      itemsPrice: (json['itemsPrice'] as num?)?.toDouble(),
      deliveryPrice: (json['deliveryPrice'] as num?)?.toDouble(),
      taxPrice: (json['taxPrice'] as num?)?.toDouble(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      isDelivered: json['isDelivered'] as bool?,
      isPaid: json['isPaid'] as bool?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$OrderVOToJson(OrderVO instance) => <String, dynamic>{
      'deliveryAddress': instance.deliveryAddress,
      'orderItems': instance.orderItems,
      'user': instance.user,
      'paymentMethod': instance.paymentMethod,
      'itemsPrice': instance.itemsPrice,
      'deliveryPrice': instance.deliveryPrice,
      'taxPrice': instance.taxPrice,
      'totalPrice': instance.totalPrice,
      'isDelivered': instance.isDelivered,
      'isPaid': instance.isPaid,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
