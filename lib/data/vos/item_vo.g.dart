// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemVOAdapter extends TypeAdapter<ItemVO> {
  @override
  final int typeId = 2;

  @override
  ItemVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemVO(
      id: fields[0] as String?,
      name: fields[1] as String?,
      modelName: fields[2] as String?,
      brand: fields[3] as String?,
      price: fields[4] as double?,
      operatingSystem: fields[5] as String?,
      graphicCard: fields[6] as String?,
      description: fields[7] as String?,
      rating: fields[8] as double?,
      category: fields[9] as String?,
      image: fields[10] as String?,
      images: (fields[11] as List?)?.cast<String>(),
      inStock: fields[12] as int?,
      numberOfReviews: fields[13] as int?,
      reviews: (fields[14] as List?)?.cast<ReviewVO>(),
      createdAt: fields[15] as String?,
      updatedAt: fields[16] as String?,
      v: fields[17] as int?,
      itemCount: fields[18] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemVO obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.modelName)
      ..writeByte(3)
      ..write(obj.brand)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.operatingSystem)
      ..writeByte(6)
      ..write(obj.graphicCard)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.category)
      ..writeByte(10)
      ..write(obj.image)
      ..writeByte(11)
      ..write(obj.images)
      ..writeByte(12)
      ..write(obj.inStock)
      ..writeByte(13)
      ..write(obj.numberOfReviews)
      ..writeByte(14)
      ..write(obj.reviews)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
      ..write(obj.updatedAt)
      ..writeByte(17)
      ..write(obj.v)
      ..writeByte(18)
      ..write(obj.itemCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemVO _$ItemVOFromJson(Map<String, dynamic> json) => ItemVO(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      modelName: json['modelName'] as String?,
      brand: json['brand'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      operatingSystem: json['operatingSystem'] as String?,
      graphicCard: json['graphicCard'] as String?,
      description: json['description'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      category: json['category'] as String?,
      image: json['image'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      inStock: json['inStock'] as int?,
      numberOfReviews: json['numberOfReviews'] as int?,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
      itemCount: json['itemCount'] as int?,
    );

Map<String, dynamic> _$ItemVOToJson(ItemVO instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'modelName': instance.modelName,
      'brand': instance.brand,
      'price': instance.price,
      'operatingSystem': instance.operatingSystem,
      'graphicCard': instance.graphicCard,
      'description': instance.description,
      'rating': instance.rating,
      'category': instance.category,
      'image': instance.image,
      'images': instance.images,
      'inStock': instance.inStock,
      'numberOfReviews': instance.numberOfReviews,
      'reviews': instance.reviews,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'itemCount': instance.itemCount,
    };
