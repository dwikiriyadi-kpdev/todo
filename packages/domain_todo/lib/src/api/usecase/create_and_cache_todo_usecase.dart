import 'package:data_todo/data_todo.dart';

abstract class CreateAndCacheTodoUseCase {
  Future<TodoModel> call(AddEditTodoRequest request);
}