import 'package:json_annotation/json_annotation.dart';

part 'data_request.g.dart';

@JsonSerializable(includeIfNull: false)
class DataRequest {
  final String? data;

  DataRequest({this.data});

  Map<String, dynamic> toJson() => _$DataRequestToJson(this);
}
