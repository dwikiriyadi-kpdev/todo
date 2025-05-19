import 'package:json_annotation/json_annotation.dart';
import 'package:remote/remote.dart';

part 'next_paginate_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NextPaginateResponse<T extends Response<R>, R> extends CoreResponse<T, R> {
  final List<T>? data;

  @JsonKey(name: 'metadata')
  final Metadata? meta;

  NextPaginateResponse({
    this.data,
    this.meta,
  });

  factory NextPaginateResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
    R Function(Object? json) fromJsonR,
  ) => _$NextPaginateResponseFromJson(json, fromJsonT, fromJsonR);

  Paging<R> toMap({List<R>? previous}) {
    final items = <R>[
      if (previous != null) ...previous,
      if (data != null) ...data!.map((e) => e.toMap()),
    ];

    return Paging<R>(
      limit: meta?.pagination.limit ?? data?.length ?? 0,
      page: meta?.pagination.page ?? 1,
      nextPage: meta?.pagination.nextPage ?? false,
      total: meta?.pagination.total ?? 0,
      prevPage: meta?.pagination.prevPage ?? false,
      items: items,
    );
  }
}
