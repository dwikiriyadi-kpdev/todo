import 'package:data_todo/data_todo.dart';

abstract class TodoRepository {
  Future<void> saveTodosToLocalStorage(List<TodoModel> todos);

  Future<List<TodoModel>> getAllTodosFromLocalStorage();

  Future<void> saveTodoToLocalStorage(TodoModel todo);

  Future<TodoModel?> getTodoFromLocalStorage(String id);

  Future<void> deleteTodoFromLocalStorage(String id);

  Future<List<TodoModel>> getList();

  Future<TodoModel> getDetail(String id);

  Future<TodoModel> createTodo(AddEditTodoRequest request);

  Future<TodoModel> updateTodo(String id, AddEditTodoRequest request);

  Future<TodoModel> patchingTodo(String id, PatchingTodoRequest request);

  Future<String> deleteTodo(String id);
}
