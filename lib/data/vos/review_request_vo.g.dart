// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_request_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewRequest _$ReviewRequestFromJson(Map<String, dynamic> json) =>
    ReviewRequest(
      name: json['name'] as String?,
      comment: json['comment'] as String?,
      rating: json['rating'] as int?,
    );

Map<String, dynamic> _$ReviewRequestToJson(ReviewRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'comment': instance.comment,
      'rating': instance.rating,
    };
