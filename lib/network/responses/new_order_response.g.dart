// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewOrderResponse _$NewOrderResponseFromJson(Map<String, dynamic> json) =>
    NewOrderResponse(
      success: json['success'] as bool?,
      order: json['order'] == null
          ? null
          : OrderVO.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewOrderResponseToJson(NewOrderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'order': instance.order,
    };
