// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_paginate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextPaginateResponse<T, R>
_$NextPaginateResponseFromJson<T extends Response<R>, R>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
  R Function(Object? json) fromJsonR,
) => NextPaginateResponse<T, R>(
  data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
  meta:
      json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NextPaginateResponseToJson<T extends Response<R>, R>(
  NextPaginateResponse<T, R> instance,
  Object? Function(T value) toJsonT,
  Object? Function(R value) toJsonR,
) => <String, dynamic>{
  'data': instance.data?.map(toJsonT).toList(),
  'metadata': instance.meta,
};
