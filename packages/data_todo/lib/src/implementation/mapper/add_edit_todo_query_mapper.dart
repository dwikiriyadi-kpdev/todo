import 'package:data_todo/src/api/query/add_edit_todo_query.dart';
import 'package:data_todo/src/implementation/remote/request/add_edit_todo_request.dart';

class AddEditTodoQueryMapper {
  static AddEditTodoRequest toRequest(AddEditTodoQuery query) {
    return AddEditTodoRequest(
      title: query.title,
      description: query.description,
      completed: query.completed,
    );
  }
}