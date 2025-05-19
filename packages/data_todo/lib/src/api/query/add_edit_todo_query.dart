import 'package:data_todo/src/implementation/remote/request/add_edit_todo_request.dart';

export 'package:data_todo/src/implementation/remote/request/add_edit_todo_request.dart';

class AddEditTodoQuery {
  final String title;
  final String description;
  final bool completed;

  AddEditTodoQuery({
    required this.title,
    required this.description,
    required this.completed,
  });
}
