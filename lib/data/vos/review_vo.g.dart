// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReviewVOAdapter extends TypeAdapter<ReviewVO> {
  @override
  final int typeId = 3;

  @override
  ReviewVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewVO(
      name: fields[0] as String?,
      comment: fields[1] as String?,
      rating: fields[2] as int?,
      id: fields[3] as String?,
      createdAt: fields[4] as String?,
      updatedAt: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewVO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.comment)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewVO _$ReviewVOFromJson(Map<String, dynamic> json) => ReviewVO(
      name: json['name'] as String?,
      comment: json['comment'] as String?,
      rating: json['rating'] as int?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ReviewVOToJson(ReviewVO instance) => <String, dynamic>{
      'name': instance.name,
      'comment': instance.comment,
      'rating': instance.rating,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
