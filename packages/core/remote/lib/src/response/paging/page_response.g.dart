// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageResponse _$PageResponseFromJson(Map<String, dynamic> json) => PageResponse(
  total: (json['total_record'] as num?)?.toInt(),
  page: (json['current'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  totalPage: (json['total_page'] as num?)?.toInt(),
);

Map<String, dynamic> _$PageResponseToJson(PageResponse instance) =>
    <String, dynamic>{
      'total_record': instance.total,
      'current': instance.page,
      'limit': instance.limit,
      'total_page': instance.totalPage,
    };
