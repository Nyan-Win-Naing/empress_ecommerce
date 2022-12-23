// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderItemVOAdapter extends TypeAdapter<OrderItemVO> {
  @override
  final int typeId = 6;

  @override
  OrderItemVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderItemVO(
      name: fields[0] as String?,
      price: fields[1] as double?,
      quantity: fields[2] as int?,
      image: fields[3] as String?,
      item: fields[4] as String?,
      id: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderItemVO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.item)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItemVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemVO _$OrderItemVOFromJson(Map<String, dynamic> json) => OrderItemVO(
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      image: json['image'] as String?,
      item: json['item'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$OrderItemVOToJson(OrderItemVO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'image': instance.image,
      'item': instance.item,
      '_id': instance.id,
    };
