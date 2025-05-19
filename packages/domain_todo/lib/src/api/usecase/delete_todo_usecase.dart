import 'package:data_todo/data_todo.dart';

abstract class DeleteTodoUseCase {
  Future<String> call(String id);
}