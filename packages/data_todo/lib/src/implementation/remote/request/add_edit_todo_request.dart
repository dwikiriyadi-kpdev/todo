import 'package:json_annotation/json_annotation.dart';

part 'add_edit_todo_request.g.dart';

@JsonSerializable(includeIfNull: false, createFactory: false)
class AddEditTodoRequest {
  final String title;
  final String description;
  final bool completed;

  AddEditTodoRequest({
    required this.title,
    required this.description,
    required this.completed,
  });

  Map<String, dynamic> toJson() => _$AddEditTodoRequestToJson(this);
}
