import 'package:data_todo/src/api/model/todo_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:remote/remote.dart';

part 'todo_response.g.dart';

@JsonSerializable(createToJson: false)
class TodoResponse extends Response<TodoModel> {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? description;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  TodoResponse({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory TodoResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseFromJson(json);

  @override
  TodoModel toMap() {
    return TodoModel(
      id: id ?? '',
      title: title ?? '',
      description: description ?? '',
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      v: v ?? 0,
    );
  }
}
