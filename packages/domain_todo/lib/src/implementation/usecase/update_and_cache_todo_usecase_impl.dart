import 'package:data_todo/data_todo.dart';
import 'package:domain_todo/src/api/usecase/update_and_cache_todo_usecase.dart';
import 'package:domain_todo/src/implementation/constant/todo_constant.dart';
import 'package:exception/exception.dart';

class UpdateAndCacheTodoUseCaseImpl implements UpdateAndCacheTodoUseCase {
  final TodoRepository _todoRepository;

  UpdateAndCacheTodoUseCaseImpl(this._todoRepository);

  @override
  Future<TodoModel> call(String id, AddEditTodoRequest request) => processResult(
    module: TodoConstant.module,
    function: TodoConstant.updateTodo,
    call: () async {
      final todo = await _todoRepository.updateTodo(id, request);
      
      await _todoRepository.saveTodoToLocalStorage(todo);

      return todo;
    },
  );
}