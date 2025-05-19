import 'package:json_annotation/json_annotation.dart';
import 'package:remote/remote.dart';

part 'paginate_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginateResponse<T extends Response<R>, R> extends CoreResponse<T, R> {
  final List<T>? data;

  @JsonKey(name: 'page')
  final PageResponse? meta;

  PaginateResponse({
    this.data,
    this.meta,
  });

  factory PaginateResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
    R Function(Object? json) fromJsonR,
  ) => _$PaginateResponseFromJson(json, fromJsonT, fromJsonR);

  Paging<R> toMap({List<R>? previous}) {
    final items = <R>[
      if (previous != null) ...previous,
      if (data != null) ...data!.map((e) => e.toMap()),
    ];

    return Paging<R>(
      limit: meta?.limit ?? 0,
      page: meta?.page ?? 1,
      nextPage: (meta?.totalPage ?? 0) > (meta?.page ?? 0),
      prevPage: meta?.page != 1,
      total: meta?.total ?? 0,
      totalPage: meta?.totalPage ?? 0,
      items: items,
    );
  }
}
