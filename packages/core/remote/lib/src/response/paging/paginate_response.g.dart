// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginateResponse<T, R> _$PaginateResponseFromJson<T extends Response<R>, R>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
  R Function(Object? json) fromJsonR,
) => PaginateResponse<T, R>(
  data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
  meta:
      json['page'] == null
          ? null
          : PageResponse.fromJson(json['page'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaginateResponseToJson<T extends Response<R>, R>(
  PaginateResponse<T, R> instance,
  Object? Function(T value) toJsonT,
  Object? Function(R value) toJsonR,
) => <String, dynamic>{
  'data': instance.data?.map(toJsonT).toList(),
  'page': instance.meta,
};
