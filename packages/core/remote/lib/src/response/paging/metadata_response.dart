import 'package:json_annotation/json_annotation.dart';

part 'metadata_response.g.dart';

@JsonSerializable()
class Metadata {
  final Pagination pagination;

  Metadata({required this.pagination});

  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class Pagination {
  final int limit;

  @JsonKey(name: 'next_page')
  final bool nextPage;

  final int page;

  @JsonKey(name: 'prev_page')
  final bool prevPage;

  final int total;

  Pagination({
    required this.limit,
    required this.nextPage,
    required this.page,
    required this.prevPage,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
