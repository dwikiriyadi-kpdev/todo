import 'package:json_annotation/json_annotation.dart';

part 'patching_todo_request.g.dart';

@JsonSerializable(includeIfNull: false, createFactory: false)
class PatchingTodoRequest {
  final bool completed;

  PatchingTodoRequest({
    required this.completed,
  });

  Map<String, dynamic> toJson() => _$PatchingTodoRequestToJson(this);
}