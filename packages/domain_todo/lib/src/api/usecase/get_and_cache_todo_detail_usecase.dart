import 'package:data_todo/data_todo.dart';

abstract class GetAndCacheTodoDetailUseCase {
  Future<TodoModel> call(String id);
}