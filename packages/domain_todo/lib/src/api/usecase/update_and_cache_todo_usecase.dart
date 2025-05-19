import 'package:data_todo/data_todo.dart';

abstract class UpdateAndCacheTodoUseCase {
  Future<TodoModel> call(String id, AddEditTodoRequest request);
}