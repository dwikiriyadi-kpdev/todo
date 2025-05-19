import 'package:data_todo/data_todo.dart';

abstract class PatchAndCacheTodoUseCase {
  Future<TodoModel> call(String id, PatchingTodoRequest request);
}