import 'package:data_todo/data_todo.dart';
import 'package:domain_todo/src/api/usecase/create_and_cache_todo_usecase.dart';
import 'package:domain_todo/src/implementation/constant/todo_constant.dart';
import 'package:exception/exception.dart';

class CreateAndCacheTodoUseCaseImpl implements CreateAndCacheTodoUseCase {
  final TodoRepository _todoRepository;

  CreateAndCacheTodoUseCaseImpl(this._todoRepository);

  @override
  Future<TodoModel> call(AddEditTodoRequest request) => processResult(
    module: TodoConstant.module,
    function: TodoConstant.createTodo,
    call: () async {
      final todo = await _todoRepository.createTodo(request);
      
      await _todoRepository.saveTodoToLocalStorage(todo);

      return todo;
    },
  );
}