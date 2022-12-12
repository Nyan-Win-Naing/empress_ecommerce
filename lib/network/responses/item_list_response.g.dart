// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemListResponse _$ItemListResponseFromJson(Map<String, dynamic> json) =>
    ItemListResponse(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      countItems: json['countItems'] as int?,
      page: json['page'] as int?,
      pages: json['pages'] as int?,
    );

Map<String, dynamic> _$ItemListResponseToJson(ItemListResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'countItems': instance.countItems,
      'page': instance.page,
      'pages': instance.pages,
    };
