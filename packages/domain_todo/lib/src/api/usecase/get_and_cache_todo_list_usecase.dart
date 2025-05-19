import 'package:data_todo/data_todo.dart';

abstract class GetAndCacheTodoListUseCase {
  Future<List<TodoModel>> call();
}
