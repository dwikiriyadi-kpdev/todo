// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
  pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
  'pagination': instance.pagination,
};

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  limit: (json['limit'] as num).toInt(),
  nextPage: json['next_page'] as bool,
  page: (json['page'] as num).toInt(),
  prevPage: json['prev_page'] as bool,
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'next_page': instance.nextPage,
      'page': instance.page,
      'prev_page': instance.prevPage,
      'total': instance.total,
    };
