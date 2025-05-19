import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String createdAt;
  final String updatedAt;
  final int v;

  const TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory TodoModel.empty() => TodoModel(
    id: '',
    title: '',
    description: '',
    createdAt: '',
    updatedAt: '',
    v: 0,
  );

  @override
  List<Object?> get props => [id, title, description, createdAt, updatedAt, v];
}
