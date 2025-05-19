import 'package:json_annotation/json_annotation.dart';

part 'page_response.g.dart';

@JsonSerializable()
class PageResponse {
  @JsonKey(name: 'total_record')
  final int? total;

  @JsonKey(name: 'current')
  final int? page;

  final int? limit;

  @JsonKey(name: 'total_page')
  final int? totalPage;

  PageResponse({
    this.total,
    this.page,
    this.limit,
    this.totalPage,
  });

  factory PageResponse.fromJson(Map<String, dynamic> json) => _$PageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PageResponseToJson(this);
}

