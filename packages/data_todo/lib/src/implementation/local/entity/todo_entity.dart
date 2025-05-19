import 'package:hive_ce/hive.dart';
import 'package:storage/storage.dart';
import 'package:data_todo/src/api/model/todo_model.dart';

part 'todo_entity.g.dart';

@HiveType(typeId: 1)
class TodoEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String createdAt;

  @HiveField(4)
  final String updatedAt;

  @HiveField(5)
  final int v;

  TodoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory TodoEntity.fromModel(TodoModel model) {
    return TodoEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      v: model.v,
    );
  }

  TodoModel toMap() {
    return TodoModel(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
    );
  }
}
