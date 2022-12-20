// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostReviewResponse _$PostReviewResponseFromJson(Map<String, dynamic> json) =>
    PostReviewResponse(
      message: json['message'] as String?,
      review: json['review'] == null
          ? null
          : ReviewVO.fromJson(json['review'] as Map<String, dynamic>),
      numberOfReviews: json['numberOfReviews'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PostReviewResponseToJson(PostReviewResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'review': instance.review,
      'numberOfReviews': instance.numberOfReviews,
      'rating': instance.rating,
    };
