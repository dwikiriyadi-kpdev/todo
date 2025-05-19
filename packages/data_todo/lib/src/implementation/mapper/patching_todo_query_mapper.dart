import 'package:data_todo/src/api/query/patching_todo_query.dart';
import 'package:data_todo/src/implementation/remote/request/patching_todo_request.dart';

class PatchingTodoQueryMapper {
  static PatchingTodoRequest toRequest(PatchingTodoQuery query) {
    return PatchingTodoRequest(
      completed: query.completed,
    );
  }
}